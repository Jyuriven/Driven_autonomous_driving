#-*- coding:utf-8 -*-
#!/usr/bin/python3

import math
import sys,os
sys.path.append('/home/driven/Driven/Driven_autonomous_driving/ros_package/driven_ros/src/driven/src/decision/library/')
import gradient

sys.path.append('/home/driven/Driven/Driven_autonomous_driving/ros_package/driven_ros/src/driven/src/control')
from imu_sex import get_imu

### YOLO import module
import cv2
import torch


sys.path.append('/home/driven/Driven/Driven_autonomous_driving/ros_package/driven_ros/src/driven/src/perception/yolov5/')
import detect
import numpy as np

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

class MotionPlanner():

    now_velocity = 0
    now_steering = 0
    now_yaw_rate = 0


    brake_level = 0 ### 1 =  30 % , 2 = 60%  3, 90%

    first_target_velocity = 0
    first_target_steering = 0
    
    second_target_velocity = 0
    second_target_steering = 0

    '''GPS 가 초기 위치로 돌아왔는지를 확인하기 위한 변수'''
    init_gps_x = 0.0
    init_gps_y = 0.0

    now_gps_x = 0.0
    now_gps_y = 0.0

    ''' 왼쪽,오른쪽 바리게이트와의 거리 차량 중심 기준 cm 단위 '''
    left_barricade_distance = 0
    right_barricade_distance = 0
    front_barricade_distance = 0

    emg = 0
    stop = 0

    '''getter'''
    def get_now_velocity(self):
        roll,pitch,yaw = get_imu()
        ''' perception IMU 에서 작성되어야 하는 코드 '''
        self.now_steering = imu.velocity
        return self.now_velocity
    
    def get_now_steering(self):
        roll,pitch,yaw = get_imu()
        self.now_steering = yaw
        print(f"[manual log] [DECISION] [MotionPlanner.py] [get_now_steeering] YAW : {yaw}")
        return self.now_steering
    
    def get_now_yawrate(self):
        roll,pitch,yaw = get_imu()
        self.now_yaw_rate = yaw
        return self.now_yaw_rate
    '''
    def get_left_barricade_distance(self):
        self.left_barricade_distance = perception.get_left_barricade_distance()
        return self.left_barricade_distance

    def get_right_barricade_distance(self):
        self.right_barricade_distance = perception.get_right_barricade_distance()
        return self.right_barricade_distance
    
    def get_front_barricade_distance(self):
        self.front_barricade_distance = perception.get_front_barricade_distance()
        return self.front_barricade_distance
    '''
    '''setter'''
    def set_target_velocity(self,target_velocity_1,target_velcoity_2):
        self.first_target_velocity = target_velocity_1
        self.second_target_velocity = target_velcoity_2
    
    def set_target_steering(self,target_steering_1,target_steering_2):
        self.first_target_steering = target_steering_1
        self.second_target_steering = target_steering_2
    
    

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

    '''
    ### 차량이 정상적인 경로로 움직이고 있는지 확인하여 만약 아니라면 핸들을 왼쪽으로 꺾으며 후진해야하는지, 오른쪽으로 꺾으며 회전해야하는지 결정한다. 
    def is_stable_status(self):
        ## 정상적이지 않은 경로라고 판단할수있는 근거가 뭘까 ?
        check_stable_code_distance = 0 ## Normal 0 Activate 1
        check_stable_code_left_right_color = 0 ## Normal 0 Activate 2
        check_stable_code_ALL = 0 ## Normal 0 Activate 5

        if self.get_left_barricade_distance < 100 or self.get_right_barricade_distance < 100 :## 1m
            print(" ################################################")
            print(" ########### too close with baricade ############")
            print(" ####left distance : %d right distance : %d#####",self.left_barricade_distance,self.right_barricade_distance)
            print(" ################################################")
            check_stable_code_distance = 1

        
        if perception.is_barricade_color_position_Defualt() == False:
            print(" ################################################")
            print(" ####### NOT DEFUALT BARRICADE POSITION ########")
            print(" ################################################")
            if check_stable_code_distance == 1:
                check_stable_code_ALL = 5

            check_stable_code_left_right_color = 2


        if check_stable_code_ALL == 5:
            return check_stable_code_ALL

        if check_stable_code_distance == 1:
            return check_stable_code_distance

        if check_stable_code_left_right_color == 2:
            return check_stable_code_left_right_color
            
        
    
    def stableMotionning(self,smoothingpath,LAD):
        ### look ahead distance 를 고려해야할수도 있음. 
        print("현재속도 : ", self.get_now_velocity())
        print("현재스티어링각 : ",self.get_now_steering())
        print("현재 yawrate : ",self.get_now_yawrate())
        
        radian_tmp = gradient.calculate_radian(smoothingpath[2*LAD][0],smoothingpath[2*LAD][1],smoothingpath[3*LAD][0],smoothingpath[3*LAD][1])
        target_degree = gradient.rad2deg(radian_tmp)
        self.first_target_steering =  target_degree - self.get_now_steering
        self.first_target_velocity = DEFAULT_VELOCITY-5

        return self
    '''
    ''' 
        LAD : Look Ahead Distance , 바라보고 있는 방향으로의 거리 
        LOOK AHEAD DISTANCE 를 함수의 인자로 넣는 이유는 차량의 속도에 따라서 목표지점과의 각도 계산을 달리 해야하기 때문이다.
        예를들어, 1m 앞에 있는 점을 첫번쨰 motion planning 지점으로 놓을건지, 10cm 앞에 있는 점을 첫번쨰 motion planning 지점으로 놓을건지를 결정한다는 말이다. 
    '''

    
    def isInitPosition_by_gps(self,outlier):
        return False
        '''
        if  self.init_gps_x == self.now_gps_x and self.init_gps_y == self.now_gps_y:
            print(f"[manual log] [DECISION] [MotionPlanner.py] [isInitPoision_by_gps] init_gps_coordinate x:{self.init_gps_x},y:{self.init_gps_y}")
            print(f"[manual log] [DECISION] [MotionPlanner.py] [isInitPoision_by_gps] now_gps_coordinate x:{self.now_gps_x},y:{self.now_gps_y}")
            return True ## 제자리로 돌아왔다 ! 근데 오차가 있어서 정수로 비교하던지 소숫점 n 번쨰 짜리로 하던지 해야함.
        
        if abs(self.init_gps_x - self.now_gps_x) < outlier and abs(self.init_gps_y - self.now_gps_y) < outlier :
            print(f"[manual log] [DECISION] [MotionPlanner.py] [isInitPoision_by_gps] init_gps_coordinate x:{self.init_gps_x},y:{self.init_gps_y}")
            print(f"[manual log] [DECISION] [MotionPlanner.py] [isInitPoision_by_gps] now_gps_coordinate x:{self.now_gps_x},y:{self.now_gps_y}")
            print("######but activate outlier filter VALUE####")
            return True ## 제자리로 돌아왔다 ! 근데 오차가 있어서 정수로 비교하던지 소숫점 n 번쨰 짜리로 하던지 해야함.

        else:
            False
        '''
    

    def motionplanning(self,smoothingpath,LAD):
        #---미완성코드---
        ## 우리 차가 초기 위치로 돌아왔냐 ? --- 
        cnt=0
        try:
        
            
            #print(f'crash: {e}, stop sign: {s}')
            #### e : 벽에 박을 것 같을 때 사용하는 변수 현재 3
            #### s : 정지 신호 
                ## 0 : 파란색이랑 노란색만 보일 때 
                ## 1 : 오렌지 콘만 보일 때 
                ## 2 : ROI 오랜지 콘 들어올 때 
            s=0
            ##gps 
            
            if self.isInitPosition_by_gps(0.000001):
                self.first_target_steering = 0
                self.second_target_steering = 0
                self.first_target_velocity = 0
                self.second_target_velocity = 0
                self.brake_level = 90 ## level 3
                return self 
            
            cnt=cnt+1
            ''' 전방에 빨간콘이 존재하지 않을 때 '''
            if s==0:
                ''' 
                    모션플래닝 테스트 코드 1
                        * 작동방식
                            1. pathplanning(A*) -> path_smoothing 과정을 거친 경로에 대한 점 n개가 2*n 배열로 생김
                            2. 2*n 배열에서 LAD ( Look Ahead Distance ) : 만큼 앞에 있는 경로 지점과 그 바로 앞 지점 or 다시 Look Ahead Distance 만큼 떨어진 지점의 기울기 차이를 구한다.
                                2-1) 현재위치 (0.0) 다음경로 (2,0) 그 다음경로(4,0)
                                2-2) 2,0 과 0,0 의 기울기 차이를 구하여 첫번째 스티어링 각으로 설정 
                                2-3) 4,0 과 2,0 의 기울기 차이를 구하여 두번째 스티어링 각으로 설정함.
                '''
                
                radian_tmp = gradient.calculate_radian(smoothingpath[LAD][0],smoothingpath[LAD][1],smoothingpath[LAD+1][0],smoothingpath[LAD+1][1])
                target_degree =  gradient.rad2deg(radian_tmp)
                 
                print(f"[manual log] [DECISION] [MotionPlanner.py] value1:target_degree{target_degree}")
            
                #self.first_target_steering = target_degree - self.get_now_steering()
                #self.first_target_steering = target_degree - self.get_now_steering()
                
                self.first_target_steering = int(target_degree) - self.get_now_steering()
              
                self.now_steering = self.first_target_steering
                self.first_target_velocity = 10
                self.brake_level = 0

                if self.first_target_steering > 10:
                    self.first_target_velocity = 5
                    self.brake_level = 30

                #radian_tmp = gradient.calculate_radian(smoothingpath[1+LAD][0],smoothingpath[1+LAD][1],smoothingpath[LAD+2][0],smoothingpath[LAD+2][1])
                #target_degree = gradient.rad2deg(radian_tmp)

                #self.second_target_steering = target_degree - self.get_now_steering # degree
                #self.second_target_velocity = DEFAULT_VELOCITY
                
                return self
            
                '''
                    모션플래닝 테스트 코드 2
                        * 작동방식
                            1. perception 에게 데이터를 받아 올때, 왼쪽 콘과 오른쪽 콘의 위치를 따로 저장한 배열을 전달받는다.
                            2. 왼쪽콘[1] 오른쪽콘[1] 의 산술평균을 이동경로 1지점으로 설정한다.
                            3. 현재 yaw rate 와 1지점과의 기울기 차이를 구하여, 조향각으로 설정한다. 
                '''
            
            ### 빨간콘이 존재하고, 전방 콘과의 거리가 10 미터 이내일때 
            
            elif s==1 : 
                '''해당 함수는 거리 10m 전에서 멈추는것이였지만 지금은 ROI 안에 들어오면 brake 3단계 작동으로 변했음. 따라서 THRESHOLD 사용할것이 아니라 
                    ROI 에 주황색 콘이 들어오면 멈추는 함수로 바꿔야 함.  9.22(금) 조용재와 함께 할 예정 ! 
                '''    
                self.set_target_steering(0,0)
                self.set_target_velocity(5,5)
                self.brake_level = 10
                return self
            
            elif s==2:
                print(" ************ OH FUCK! WE SHOULD STOP!! ***************** ") ### ROI 안에 들어오면 3단계 브레이크 작동 
                print(" ***************  DECREASE VELOCITY  ******************** ")
                self.set_target_steering(0,0)
                self.set_target_velocity(0,0)
                self.brake_level = 90
                return self
            
        except():
            print('z')
        ###             
            
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
    
    def motionplanning_for_point(self,car_x,car_y,goal_x,goal_y,LAD,e,s):
    #---미완성코드---
    ## 우리 차가 초기 위치로 돌아왔냐 ? --- 
        try:
            
            #print(f'crash: {e}, stop sign: {s}')
            #### e : 벽에 박을 것 같을 때 사용하는 변수 현재 3
            #### s : 정지 신호 
                ## 0 : 파란색이랑 노란색만 보일 때 
                ## 1 : 오렌지 콘만 보일 때 
                ## 2 : ROI 오랜지 콘 들어올 때 
            now_steer = self.get_now_steering()
            
            if self.isInitPosition_by_gps(0.0000001) or e:
                self.first_target_steering = 0
                self.second_target_steering = 0
                self.first_target_velocity = 0
                self.second_target_velocity = 0
                self.brake_level = 90 ## level 3
                return self 
           
            ''' 전방에 빨간콘이 존재하지 않을 때 '''
            if s==0:
                ''' 
                    모션플래닝 테스트 코드 1
                        * 작동방식
                            1. pathplanning(A*) -> path_smoothing 과정을 거친 경로에 대한 점 n개가 2*n 배열로 생김
                            2. 2*n 배열에서 LAD ( Look Ahead Distance ) : 만큼 앞에 있는 경로 지점과 그 바로 앞 지점 or 다시 Look Ahead Distance 만큼 떨어진 지점의 기울기 차이를 구한다.
                                2-1) 현재위치 (0.0) 다음경로 (2,0) 그 다음경로(4,0)
                                2-2) 2,0 과 0,0 의 기울기 차이를 구하여 첫번째 스티어링 각으로 설정 
                                2-3) 4,0 과 2,0 의 기울기 차이를 구하여 두번째 스티어링 각으로 설정함.
                '''
                now_steer = self.get_now_steering()
                

                ###### LiDar 배열의 yaw rate 각 만큼의 회전을 통하여 실제 imu가 바라보고 있는 방향으로의 조향각을 구한다.
                ###### 만약 값이 이상하다면 now_steer 를 - now steer 로 바꿔야합니다. 
                
                
                radian_point = gradient.calculate_radian(car_x,car_y,goal_x,goal_y)

                
                print(f"[manual log] [DECISION] [MotionPlanner.py] [ Motion Planning ] radian_ : {radian_point}")

                target_degree =  gradient.rad2deg(radian_point)


                
                print(f"[manual log] [DECISION] [MotionPlanner.py] [ Motion Planning ] target_degree : {target_degree}")
            
                #self.first_target_steering = target_degree - self.get_now_steering()
                #self.first_target_steering = target_degree - self.get_now_steering()
                
                self.first_target_steering = int(target_degree) - int(now_steer)

                print(f"[manual log] [DECISION] [MotionPlanner.py] [Motion Planning] first_target_steering {self.first_target_steering}")
                self.now_steering = self.first_target_steering
                self.first_target_velocity = 10
                self.brake_level = 0

                if self.first_target_steering > 10:
                    self.first_target_velocity = 5
                    self.brake_level = 30

                #radian_tmp = gradient.calculate_radian(smoothingpath[1+LAD][0],smoothingpath[1+LAD][1],smoothingpath[LAD+2][0],smoothingpath[LAD+2][1])
                #target_degree = gradient.rad2deg(radian_tmp)

                #self.second_target_steering = target_degree - self.get_now_steering # degree
                #self.second_target_velocity = DEFAULT_VELOCITY
            
                return self
            
                '''
                    모션플래닝 테스트 코드 2
                        * 작동방식
                            1. perception 에게 데이터를 받아 올때, 왼쪽 콘과 오른쪽 콘의 위치를 따로 저장한 배열을 전달받는다.
                            2. 왼쪽콘[1] 오른쪽콘[1] 의 산술평균을 이동경로 1지점으로 설정한다.
                            3. 현재 yaw rate 와 1지점과의 기울기 차이를 구하여, 조향각으로 설정한다. 
                '''
            
            ### 빨간콘이 존재하고, 전방 콘과의 거리가 10 미터 이내일때 
            
            elif s==1 : 
                '''해당 함수는 거리 10m 전에서 멈추는것이였지만 지금은 ROI 안에 들어오면 brake 3단계 작동으로 변했음. 따라서 THRESHOLD 사용할것이 아니라 
                    ROI 에 주황색 콘이 들어오면 멈추는 함수로 바꿔야 함.  9.22(금) 조용재와 함께 할 예정 ! 
                '''    
                self.set_target_steering(0,0)
                self.set_target_velocity(5,5)
                self.brake_level = 10
                return self
            
            elif s==2:
                print(" ************ OH FUCK! WE SHOULD STOP!! ***************** ") ### ROI 안에 들어오면 3단계 브레이크 작동 
                print(" ***************  DECREASE VELOCITY  ******************** ")
                self.set_target_steering(0,0)
                self.set_target_velocity(0,0)
                self.brake_level = 90
                return self
            
        except():
            print('z')

    def set_steering(self,target_steering):
        self.velocity = target_steering

    def set_velocity(self,target_velocity):
        self.steering = target_velocity

    
