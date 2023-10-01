from math import atan

class YawController(object):
    def __init__(self, wheel_base, steer_ratio, min_speed, max_lat_accel, max_steer_angle):
        self.wheel_base = wheel_base
        self.steer_ratio = steer_ratio
        self.min_speed = min_speed
        self.max_lat_accel = max_lat_accel
        self.min_angle = -max_steer_angle
        self.max_angle = max_steer_angle
		
    def get_angle(self, radius):
        if radius==0:	
            return 0
        else:
            angle = atan(self.wheel_base / radius) * self.steer_ratio
            return max(self.min_angle, min(self.max_angle, angle))
		
    def get_steering(self, current_velocity, linear_velocity, angular):
        print(current_velocity,linear_velocity,angular)
        if angular == 0:
             return 0
        
        if linear_velocity!=0:
             if linear_velocity > current_velocity:
                   angular = current_velocity * angular / linear_velocity
                   
        if angular!=0:
            return self.get_angle(max(current_velocity, self.min_speed) / angular)*21.0

