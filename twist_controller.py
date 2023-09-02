import rospy
from yaw_controller import YawController
from pid import PID
from lowpass import LowPassFilter

Full_brake = 1

class Controller(object):
    stop_sign = False
    start_time=0
    def __init__(self, vehicle_mass, brake_deadband, decel_limit, accel_limit,
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
        tau = 0.5  # cutoff frequency, i.e., 1/(2*pi*tau)
        ts = 0.02  # sample time
        self.vel_lpf = LowPassFilter(tau, ts)

        self.vehicle_mass = vehicle_mass
        self.brake_deadband = brake_deadband
        self.decel_limit = decel_limit
        self.accel_limit = accel_limit
        self.wheel_radius = wheel_radius

        self.last_time = rospy.get_time()
        self.last_vel = 0.0

    def control(self, current_vel, linear_vel, angular_vel, stop_sign):
        
        '''
        current_vel: 현재 속도
        linear_vel: 목표 속도
        angular_vel: 목표 각속도
        '''
        
        #필요없다고 판단되어서 주석처리"
        
        '''
        if not dbw_enabled:
            self.throttle_controller.reset()
            return 0.0, 0.0, 0.0
        '''
        
        #LowPassFilter 클래스를 통한 노이즈 제거
        current_vel = self.vel_lpf.filt(current_vel)

        steering = self.yaw_controller.get_steering(linear_vel, angular_vel, current_vel, stop_sign)
        
        #목표속도와 현재 속도 오차 연산
        vel_error = linear_vel - current_vel
        self.last_vel = current_vel

        current_time = rospy.get_time()
        sample_time = current_time - self.last_time

        throttle = self.throttle_controller.step(vel_error, sample_time)
        brake = 0.0
        
        if linear_vel == 0.0 and current_vel < 0.1:
            throttle = 0.0
            brake = Full_brake
            if stop_sign:
                start_time = rospy.get_time()
            stop_sign = False
            
        elif throttle < 0.1 and vel_error < 0.0:
            throtle = 0.0
            if stop_sign:
                decel = max(vel_error, self.decel_limit)
                brake = abs(decel) * self.vehicle_mass * self.wheel_radius  # Torque (N*m)
        return throttle, brake, steering, start_time