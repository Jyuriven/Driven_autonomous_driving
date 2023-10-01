from twist_controller import Controller
import rospy
import time

def main():
	rospy.init_node('rosout') 	
	master_control = Controller()
	sample_angle=[0.0,3.0,5.0,16.0,-4.0]
	sample_cur=[0.0,10.0,20.0,30.0,20.0]
	sample_liner=[5.0,13.0,25.0,32.0,19.0]
	# while True:
	# 	Throttle, Brake, Steering = master_control.control(10, 10, -25.0, 0)
	# 	print(Throttle,Brake,Steering)
	# 	time.sleep(1)
	# now = time.time()
	# time.sleep(3)
	# next_time = time.time()
	# print(now - next.time)
	for i in range(5):
		# while(now - next_time):
		print("11111",i,sample_cur[i],sample_liner[i],sample_angle[i])
		Throttle, Brake, Steering = master_control.control(sample_cur[i],sample_liner[i],sample_angle[i],0)
		next_time = time.time()
		# now = time.time()
        
if __name__ == "__main__":
    main()
