import math
import library.gradient as gradient
import perception
'''
요청해야하는 코드
###########
#PECEPTION#
###########

get_imu() : IMU 데이터를 가져옵니다.
    1. 현재속도
    2. 현재 yawrate

get_left,right,front_barricade_distance() : 차량중심기준으로 왼쪽 오른쪽 바리케이트의 거리를 계산합니다. 
    1. left_barricade_distance()
    2. right_barricade_distance()
    3. front_barricade_distance()

isBarricade() : 전방에 멈춰야하는 콘이 있나요 ? , 빨간색 콘이 발견되었나요 ?


#########
#CONTROL#
#########


'''
DEFAULT_VELOCITY = 10
BARRICADE_DISTANCE_THRESHOLD = 100  ## cm 기준 

class MotionPlan():

    now_velocity = 0
    now_steering = 0

    first_target_velocity = 0
    first_target_steering = 0
    
    second_target_velocity = 0
    second_target_steering = 0

    ''' 왼쪽,오른쪽 바리게이트와의 거리 차량 중심 기준 cm 단위 '''
    left_barricade_distance = 0
    right_barricade_distance = 0
    front_barricade_distance = 0

    '''getter'''
    def get_now_velocity(self):
        imu = perception.get_imu()
        ''' perception IMU 에서 작성되어야 하는 코드 '''
        self.now_steering = imu.velocity
        return self.now_velocity
    
    def get_now_steering(self):
        imu = perception.get_imu()
        self.now_steering = imu.yawrate
        return self.now_steering
    
    def get_left_barricade_distance(self):
        self.left_barricade_distance = perception.get_left_barricade_distance()
        return self.left_barricade_distance

    def get_right_barricade_distance(self):
        self.right_barricade_distance = perception.get_right_barricade_distance()
        return self.right_barricade_distance
    
    def get_front_barricade_distance(self):
        self.front_barricade_distance = perception.get_front_barricade_distance()
        return self.front_barricade_distance
    
    '''setter'''
    def set_target_velocity(self,target_velocity_1,target_velcoity_2):
        self.first_target_velocity = target_velocity_1
        self.second_target_velocity = target_velcoity_2
    
    def set_target_steering(self,target_steering_1,target_steering_2):
        self.first_target_steering = target_steering_1
        self.second_target_steering = target_steering_2
    

class MotionPlanner():
    
    def __init__(self):
        self.velocity = 0
        self.steering = 0
        self.yaw_rate = 0
        
    

    def calculate_target_degree(self,route):
        

        ### 현재 yaw rate 에서 목표하는 degree 와의 차이각을 비교하여 반환합니다. 
        now_degree = self.yaw_rate ## <<< 해당값은 IMU 를 통하여 가져와야 함. 
        target_degree = 0
        target_degree_set = gradient.route2gradient(route)
        route = gradient.smooth(route)
        #target_degree = math.atan(route[1][0]-route[0][0],route[1][1],route[1][0])  
        ### 정확하게 어떻게 목표경로와 현재 yaw rate 차이를 계산할것인지 결정 해야 함.
        ### 우리의 자동차는 항상 0,0 에 존재하는건가 ? 아니면 계속해서 OGM 을 항해하는것인가 ?
        ### 만약 0,0 이라면 route 에서 가장 가까운 지점까지의 각도를 구했다면 가장 가까운 지점의 위치좌표는 route 에서 뺴주고, 그 다음걸 0,0->1,1 한것과 비교해야함.

        return target_degree - now_degree

    
    def motionplanning(smoothingpath):

        ''' 빨간색 콘이 존재하지 않고, '''
        if not perception.isBarricade():
            motion_plan =  MotionPlan()
            radian_tmp = gradient.calculate_radian(smoothingpath[0][0],smoothingpath[0][1],smoothingpath[1][0],smoothingpath[1][1])
            target_degree = gradient.rad2deg(radian_tmp)
            
            motion_plan.first_target_steering = motion_plan.get_now_steering - target_degree
            motion_plan.first_target_velocity = DEFAULT_VELOCITY


            radian_tmp = gradient.calculate_radian(smoothingpath[1][0],smoothingpath[1][1],smoothingpath[2][0],smoothingpath[2][1])
            target_degree = gradient.rad2deg(radian_tmp)

            motion_plan.second_target_steering = motion_plan.first_target_steering - target_degree # degree
            motion_plan.second_target_velocity = DEFAULT_VELOCITY

            return motion_plan
        
        # ''' 임계치보다 낮은 거리르 가지고 있을 때 '''
        elif perception.isBarricade()==1 and BARRICADE_DISTANCE_THRESHOLD < 100 :
            print(1)
            return motion_plan

            
            
        ### 길 찾기 기반 경로 결정 ### 
        ### Motion Planning ### 
        ### 제약조건 
        ###### 1. 차는 최대한 차선의 중앙에서 이동해야함. 
        ###### 2. 첫번째 속도 / 조향 명령이후 다음 명령까지의 딜레이가 짧아야함. (최대한)
        ######### 2-1. 조향에 대한 피드백이 빨라야함. < 가장 우선순위 >
        ######### 2-2. 조향에 대한 피드백이 빠르지못하다면 최초에 두번째 명령까지 보내야함.
        ######### 2-3. 첫번째 속도/조향 명령 수행이후 두번째 속도/조향 명령 수행 시 다시 금 첫번째 속도/조향 명령이 업데이트 되어야함. < 차순 >

        ###### 3. 명령의 우선순위가 결정되어야 함. 
        ######  sign + obstacle >> 피드백 명령  >> 기본 명령 수행
        ######  3-1. sign+obstacle : 멈춰야하는 장애물이나 신호를 발견하면 가장먼저 수행되어야 하는 명령 
        ######  3-2. 피드백 명령 : 차가 곧 들이받게 생겼을 경우에 기본명령보다 빠르게 수행되어야 하는 피드백 명령
        ######      ex. 1. 멈춘다. 2. 장애물과의 거리를 계산하여 핸들을 왼쪽으로 돌리며 후진하던지, 오른쪽으로 돌리며 후진하던지 정상 yaw rate 로 돌아온다.
                        ## 정상 yaw rate : 직전 명령의 조향각과 yaw rate 가 같아질때 멈춘다. 
        ######  3-3. 기본명령 수행 -- 경로탐색 -> path smoothing -> 정해진 경로를 따라 명령 queue 를 만든다.

    ### 차량 상태 컨트롤 ### 
    
    def set_steering(self,target_steering):
        self.velocity = target_steering

    def set_velocity(self,target_velocity):
        self.steering = target_velocity

    