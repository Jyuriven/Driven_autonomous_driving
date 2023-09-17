from math import atan


class YawController(object):
    def __init__(self, wheel_base, steer_ratio, min_speed, max_lat_accel, max_steer_angle):
        self.wheel_base = wheel_base
        #스티어링 비율
        self.steer_ratio = steer_ratio
        self.min_speed = min_speed
        #최대 측면 가속도
        self.max_lat_accel = max_lat_accel
        #최소 조향각, 최대 조향각(라디안)
        self.min_angle = -max_steer_angle
        self.max_angle = max_steer_angle

    def get_angle(self, radius): ### 목표조향각 to 아두이노 전달 각도
        #아크탄젠트
        angle = atan(self.wheel_base / radius) * self.steer_ratio
        
        '''
        최대 조향각과 최소 조향각 사이 값인지 확인
        if  angle >= self.max_angle:
            angle=self.max_angle
            return self.max_angle
        else:
            if angle <= self.min_angle:
                return self.min_angle
        '''
        
        return max(self.min_angle, min(self.max_angle, angle))



    def get_steering(self, linear_velocity, angular, current_velocity):
        #이동 방향으로 향하는 머리를 유지하기 위한 조향각 결정(yaw contrller)
        #선속도, 각속도, 현재 속도를 포함하는 차체에서 주행조건에 맞게 조향각 평가
        #선속도가 양수인 경우, 각속도를 조정하여 현재 속도와 비례하게 제어
        if linear_velocity >= current_velocity :
            angular = current_velocity * angular / linear_velocity # degree * m / s
        
        # 현재 차량이 움직이는 상태일때 최대 허용 스티어링 각도를 계산하고
        # 각속도를 범위 내로 제한
        if abs(current_velocity) > 0:
            max_yaw_rate = abs(self.max_lat_accel / current_velocity)
            angular = max(-max_yaw_rate, min(max_yaw_rate, angular))

        # 계산된 각도가 양수일 경우, 각도에 대응하는 조향 각도로 변환
        
        return self.get_angle(max(current_velocity, self.min_speed) / angular)