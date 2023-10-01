# -*- coding: utf-8 -*-
import time
import rospy
from yaw_controller import YawController
from pid import PID
#import socket
#import math
#from pyproj import Proj, transform
#from sensor_msgs.msg import NavSatFix
#from geometry_msgs.msg import TwistWithCovarianceStamped


class Controller(object):
    
    def __init__(self, vehicle_mass=220.0,  decel_limit=100.0, accel_limit=5.0,
                 wheel_radius=505.0, wheel_base=1.320, steer_ratio=6.0, max_lat_accel=10.0, max_steer_angle=25.0):

        self.yaw_controller = YawController(wheel_base, steer_ratio, 5, max_lat_accel, max_steer_angle)
        #pid 제어값
        kp = 0.1
        ki = 0.09
        kd = 0.0
        min_throttle = 10
        max_throttle = 150
        self.throttle_controller = PID(kp, ki, kd, min_throttle, max_throttle)
        self.vehicle_mass = vehicle_mass
        self.decel_limit = decel_limit
        self.accel_limit = accel_limit
        self.wheel_radius = wheel_radius

        self.last_time = time.time()
        self.last_vel = 0.0


#    def control(self, motion_planner):
#	linear_vel = motion_planner.target_velocity	
#	angular = motion_planner.target_steering



    def control(self, current_vel, linear_vel, angular, brake):


        '''
        current_vel: 현재 속도
        linear_vel: 목표 속도
        angular: 목표 조향각
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

        ### 아두이노에 넣을 각 
        steering = self.yaw_controller.get_steering(current_vel, linear_vel, angular)
        #목표속도와 현재 속도 오차 연산
        vel_error = linear_vel - current_vel #선속도가 아니라 목표 속도가 맞는거같음.
        self.last_vel = current_vel

        current_time = time.time()
        if current_time != self.last_time:
                sample_time = current_time - self.last_time
        else:
                time.sleep(1)
                sample_time = current_time - self.last_time

        throttle = self.throttle_controller.step(vel_error, sample_time)
        print("throttle: ",throttle)
        
        # #목표 속도가 0이 되면 풀 브레이크
        # if linear_vel == 0.0 and vel_error < 3:
        #     throttle = 0.0
        #     brake = Full_brake
        #     if stop_sign:
        #         start_time = rospy.get_time()
        #     stop_sign = False
        
        # #중간브레이크는 없는가...?
        
        
        # #원하는 속도에 도달하면 쓰로틀값을 내린다.
        # elif throttle < 0.1 and vel_error < 0.0:
        #     throtle = 0.0
        #     if not stop_sign:
        #         decel = max(vel_error, self.decel_limit)
        #         #brake를 안써도 되는 구간에서도 사용할 수 있는 것 아닌가??
        #         brake = abs(decel) * self.vehicle_mass * self.wheel_radius  # Torque (N*m)
        

        print("Jetson2Ardu Control DATA ( THROTTLE ) : %d",throttle )
        print("Jetson2Ardu Control DATA ( BREAK ) : %f", brake)
        print("Jetson2Ardu Control DATA ( STEERING ) : %f", steering )
        #print("Jetson2Ardu Control DATA ( BREAK MOTOR START TIME ) : %f",start_time )

        return throttle, brake, steering
