from twist_controller import Controller
import rospy
import time

def main():
	rospy.init_node('rosout') 	
	master_control = Controller()
	###샘플 데이터###
	#sample_angle=[0.0,3.0,5.0,16.0,-4.0]
	#sample_cur=[0.0,10.0,20.0,30.0,20.0]
	#sample_liner=[5.0,13.0,25.0,32.0,19.0]
	# while True:
	#Throttle, Brake, Steering = master_control.control(10, 10, -25.0, 0)
	#print(Throttle,Brake,Steering)
	
	### currnet_vel -> 현재 속도
	### linear_vel -> 목표 속도
	### angular -> 목표 헤딩각
	### brake -> 브레이크 값
	### 브레이크 값 연산은 control
	### 파트에서 이루어지지 않고 
	### motion planning에서 연산 및 목표한
	### 데이터를 그대로 보냄
	Throttle, Brake, Steering = master_control.control(current_vel,linear_vel,angular,brake)
        
if __name__ == "__main__":
    main()
