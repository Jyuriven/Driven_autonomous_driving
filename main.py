from twist_controller import Controller
import rospy

'''
vehicle_mass: 차량의 무게 210
brake_deadband: 브레이크 페달 민감도
decel_limit: 출발 정지시 감속 제한 10
accel_limit: 최대 가속도 
wheel_radius: 바퀴 반지름 25 -> 단위확인필요
wheel_base: 차량 바퀴 사이의 거리 1319mm
steer_ratio: 조향 장치의 비율 
max_lat_accel: 차량의 최대 측면 가속도
max_steer_angle: 조향 장치의 최대 회전각도
'''

#메인
def main():
    master_control = Controller()
    
    end_time = rospy.get_time()
    if start_time - end_time > 2:
        master_control.stop_sign = True
    
    Throttle, Brake, Steering, start_time = master_control.control(210, )
    print(Throttle,Brake,Steering)
    
    
    
if __name__ == "__main__":
    main()