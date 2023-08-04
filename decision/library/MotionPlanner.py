import math
from point2gradient import route2gradient

class MotionPlanner():
    
    def __init__(self):
        self.velocity = 0
        self.steering = 0
        self.yaw_rate = 0
        
    
    def calculate_target_degree(self,route):
        ### 현재 yaw rate 에서 목표하는 degree 와의 차이각을 비교하여 반환합니다. 
        now_degree = self.yaw_rate ## <<< 해당값은 IMU 를 통하여 가져와야 함. 
        target_degree_set = route2gradient(route)

        target_degree = math.atan(route[1][0]-route[0][0],route[1][1],route[1][0])  
        ### 정확하게 어떻게 목표경로와 현재 yaw rate 차이를 계산할것인지 결정 해야 함.
        ### 우리의 자동차는 항상 0,0 에 존재하는건가 ? 아니면 계속해서 OGM 을 항해하는것인가 ?
        ### 만약 0,0 이라면 route 에서 가장 가까운 지점까지의 각도를 구했다면 가장 가까운 지점의 위치좌표는 route 에서 뺴주고, 그 다음걸 0,0->1,1 한것과 비교해야함.

        return target_degree - now_degree

    def set_steering(self,target_steering):
        self.velocity = target_steering

    def set_velocity(self,target_velocity):
        self.steering = target_velocity