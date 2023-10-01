#!/usr/bin/python
#-*- coding:utf-8 -*-

import sys
import os
import rospy
import matplotlib.pyplot as plt
from matplotlib.animation import FuncAnimation
import math
from std_msgs.msg import Int16
#from seonsor_msgs.msg import NavSatFix
#from geometry_msgs.msg import TwistWithCovarianceStamped



sys.path.append('/home/driven/driven/Driven_autonomous_driving/ros_pakage/driven_ros/src/driven/src/decision/library/')


from distance import farest_distance_point
from pathplanner import pathplanning
from MotionPlanner import MotionPlanner

sys.path.append('/home/driven/driven/Driven_autonomous_driving/ros_pakage/driven_ros/src/driven/src/control/')
from twist_controller import Controller


sys.path.append('/home/driven/driven/Driven_autonomous_driving/ros_pakage/driven_ros/src/driven/src/perception/src/slam/LeGO_LOAM/scripts/')
import mapConvert


from main_msg.msg import jet2ard,map




### import control 


### SLAM 을 실행합니다.
### --- 상세요구사항
### ------ 1. SLAM 이 동작하고 있는것을 디스플레이로 확인할 수 있어야 합니다. < 대회 중 모니터링을 위해 > 
### ------ 2. SLAM 을 만드는 주기를 선택할 수 있도록 해야합니다. ex. 1초에 한 번, 5초에 한 번, 10초에 한 번 < PATH PLANNING 연산속도에 맞춰 추후 조정을 위해 >
### ------ 3. SLAM 이 ROS 메소드로 작동하는 것을 알고 있는데, function 으로 작동하는 것이 속도가 빠른지 ? SLAM 만을 위한 프로세스를 하나 만드는것이 빠른지 확인
### ---------- 지금 코드에서는 SLAM 이 코드안의 함수로 작동 할 텐데, 잿자에서 그냥 새로운 프로세스로 실행시켜서 파일만 뽑아내고 main_thread.py 에서는 해당 파일을 가져와서 쓰는 것.
### ------ 4. SLAM 으로 뽑아내는 지도는 저장(축적)되어야 합니다.
 
### GPS와 IMU에서 지속적으로 상태값을 받아옵니다. 새로운 쓰레드로 실행되기 때문에 해당 객체에 지속적으로 값을 업데이트 합니다. 
### --- 상세요구사항
### ------ 1. GPS, IMU 값을 실시간으로 모니터링 할 수 있어야 합니다. 그렇지 않다면 일단 로그라도 작성 할 수 있또록 작성해야합니다. 
### ------ 2. GPS, IMU 값은 현재 좌표와 함께 로그로 작성되양합니다. 로그파일이름 [DEBUG]IMU_20230823_LOG.txt

motion_planner = MotionPlanner()
controller = Controller(220,0,5,505,1320,0.151,5,27)
plt.style.use('fivethirtyeight')

## global variance

def callback_main(map):
    
    main_map = [[5 for j in range(50)] for i in range(50)]

    for x,y in zip(map.x_lst,map.y_lst):
        main_map[x][y] = 1

   # main_map[map.car_x][map.car_y] = 7
    print("test")

    farest,second = farest_distance_point(main_map,map.car_x,map.car_y)
    
    
    print(farest)
    print(second)

    #main_map[farest[0]][farest[1]] = 8
    #main_map[second[0]][second[1]] = 4

    print(f'len in main : {len(map.x_lst)}, {len(map.y_lst)}')

    goal_x = int((farest[0]+second[0])/2)
    goal_y = int((farest[1]+second[1])/2)

    print("################ main map ####################")
    for i in range(50):
        for j in range(50):
            print(main_map[i][j], end = ' ')
        print()
    print("################ position ####################")
    print(f"car >>>>>>>>>>> x : {map.car_x}  y : {map.car_y}")
    print(f"goal >>>>>>>>>> x : {goal_x}  y : {goal_y}")

    path=pathplanning(main_map,map.car_x,map.car_y,goal_x,goal_y)
    
    global motion_planner
    motion_planner = motion_planner.motionplanning(path,3)

    


#    def animate():
 #       plt.cla()
  #      plt.plot(map.x_lst,map.y_lst)

   # ani = FuncAnimation(plt.gcf(), animate, interval = 1000)
    #plt.show()


    msg = jet2ard()

    msg_throttle = Int16()
    msg_steering = Int16()
    msg_brake = Int16()

    msg_throttle.data,msg_brake.data,msg_steering.data = controller.control(motion_planner,10)
  

    publisher_throttle.publish(msg_throttle)
    publisher_steering.publish(msg_steering)
    publisher_brake.publish(msg_brake)

    
    rospy.loginfo(msg_throttle)
    rospy.loginfo(msg_steering)
    rospy.loginfo(msg_brake)

    #rospy.sleep()


if __name__ == '__main__':
    try:
        rospy.init_node("jet2ard_publisher")
        publisher = rospy.Publisher(name="jet2ard_publisher",data_class=jet2ard,queue_size=1)
        publisher_throttle = rospy.Publisher(name="jet2ard_publisher_throttle",data_class=Int16,queue_size=1)
        publisher_brake = rospy.Publisher(name="jet2ard_publisher_brake",data_class=Int16,queue_size=1)
        publisher_steering = rospy.Publisher(name="jet2ard_publisher_steering",data_class=Int16,queue_size=1)
        subscriber = rospy.Subscriber('/per2main', map, callback_main)
        rospy.spin()

    except KeyboardInterrupt:
        print("######## Interupt ########")
        sys.exit(0)

### PERCEPTION

### pointcloud 데이터로부터 2D OGM cost map 을 반환합니다. 
### --- 상세요구사항 
### ------ 1. 현실의 Scale 과 맞출 수 있도록 지도 크기를 조절 할 수 있어야 합니다. 
###         배열 한 칸의 실제거리가 얼마인지 알 수 있어야 한다는 말과 같습니다. 
### ------ 2. 출력하는 2D SCALE 에 따라 장애물 크기도 같이 고려되어야 합니다. 
###        예를들어 4X4 costmap 이라면 장애물을 [1,1]=1,[0,2]=1 이런식으로 표현 할 수 있는데, 100 X 100 으로 확대된다면 더 많은 공간에 장애물을 표시하는 1이 들어가야 합니다.


#    ### DECISION
#    path=Pathplanner.pathlanning(main_map)
#    motion_planner.motionplanning(motion_planner,path)

#    ### CONTROL
#    msg = jet2ard()
#    msg.throttle,msg.brake,msg.steering,msg.start_time = control.twistController(motion_planner)
#    rospy.loginfo(msg)
#    publisher.publsh(msg)
#    rospy.sleep()

### motion plan 변수(객체)를 토대로 아두이노에 신호를 보내 차량을 움직입니다. 
### 상세요구사항 
###### 1. 속도와 조향각의 관계를 고려해야 합니다. 
######    예를들어 100km/h 가는 차가 -15 degree 회전하는것과 30km/h 속도의 차가 -15 degree 로 회전하는것은 이동범위와 목표조향각 도달 시간이 다르기 때문입니다. 
###### 2. 작동 마무리를 n 초에 할 수 있도록 작성해야하며, n 초는 선택가능해야합니다. 
######    실제 필드에 나가서 차 굴려보면서 콘을 박지 않는 목표속도도달/목표조향각도달 을 Optimizing 해야하기 때문입니다. 
###### 3. 시간과 아두이노로 보낸 데이터를 로그로 남겨야합니다. 이것도 디버그를 위해서 ~~ 파일이름 [DEBUG]JET2ARD_CONTROLDATA_20230823_LOG.txt

### MOTION PLAN 객체 **예상** 구조 
### 직후 행동과 차후 행동을 보내줄 예정입니다.
### MOTION PLAN 
###### first_motion
###### --- steering
###### --- velocity
###### --- coor_x
###### --- coor_y

###### second_motion 
###### --- steering
###### --- velocity
###### --- coor_x
###### --- coor_y
