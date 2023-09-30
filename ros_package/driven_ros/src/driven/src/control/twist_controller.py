#-*- coding:utf-8 -*-

from yaw_controller import YawController
from pid import PID

import time


Full_brake = 1

class Controller(object):
    #stop_sign이 false면 리니어 모터는 움직이고 있다.
    

    def __init__(self, vehicle_mass, decel_limit, accel_limit,
                 wheel_radius, wheel_base, steer_ratio, max_lat_accel, max_steer_angle):
        '''
        vehicle_mass: 차량의 무게
        brake_deadband: 브레이크 페달 민감도
        decel_limit: 출발 정지시 감속 제한
        accel_limit: 최대 가속도
        wheel_radius: 바퀴 반지름
        wheel_base: 차량 바퀴 사이의 거리
        steer_ratio: 조향 장치의 비율
        max_lat_accel: 차량의 최대 측면 가속도
        max_steer_angle: 조향 장치의 최대 회전각도
        '''
        self.yaw_controller = YawController(wheel_base, steer_ratio, 0.1, max_lat_accel, max_steer_angle)

        #pid 제어값
        kp = 0.3
        ki = 0.1
        kd = 0.0
        min_throttle = 0.0
        max_throttle = 0.2
        self.throttle_controller = PID(kp, ki, kd, min_throttle, max_throttle)
        
        
        #차단 주파수
        '''
        tau = 0.5  # cutoff frequency, i.e., 1/(2*pi*tau)
        ts = 0.02  # sample time
        self.vel_lpf = LowPassFilter(tau, ts)
        '''
        
        self.vehicle_mass = vehicle_mass
        self.decel_limit = decel_limit
        self.accel_limit = accel_limit
        self.wheel_radius = wheel_radius

        self.last_time = time.time()
        self.last_vel = 0.0

    def control(self, motion_planner, current_vel_from_gps):

        '''
        motion_planner : first steering, first velocity , brake level
        current_vel_from_gps : current velocity from gps sensor
        '''
        # 전달받을 값들

        # first_steering
        # second_steering
        # first_velocity
        # seconds_velocity
        
        
        #필요없다고 판단되어서 주석처리"
        '''
        if not dbw_enabled:
            self.throttle_controller.reset()
            return 0.0, 0.0, 0.0
        '''
        
        #LowPassFilter 클래스를 통한 노이즈 제거 (필요 없음)
        #current_vel = self.vel_lpf.filt(current_vel)


        #### ignore second mission
        linear_vel = motion_planner.first_target_velocity
        angular = motion_planner.first_target_steering


        ### 아두이노에 처 넣을 각 
        steering = self.yaw_controller.get_steering(linear_vel, angular, current_vel_from_gps)
        
        #목표속도와 현재 속도 오차 연산
        vel_error = linear_vel - current_vel_from_gps #선속도가 아니라 목표 속도가 맞는거같음.
        self.last_vel = current_vel_from_gps

        current_time = time.time()
        sample_time = current_time - self.last_time

        throttle = self.throttle_controller.step(vel_error, sample_time)        

        self.last_time = current_time

        print("Jetson2Ardu Control DATA : ")
        print("Jetson2Ardu Control DATA ( THROTTLE ) : %d",throttle )
        print("Jetson2Ardu Control DATA ( BREAK ) : %f", 0)
        print("Jetson2Ardu Control DATA ( STEERING ) : %f", steering )

        return throttle, 0, steering
