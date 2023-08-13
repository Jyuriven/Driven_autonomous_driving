import control
import decision
import perception
import threading
import sys

### import control 

lidar_con = perception.Lidar_Connection() ### 라이다를 연결하고, 라이다 커넥션 객체를 반환합니다. 
imu_con = perception.Imu_Connection() ### IMU 객체 반환 
ardu_con = control.ardu_con() ### 아두이노 객체 반환 
gps_con = perception.Gps_connection()


lidar_con.SLAM() 
### SLAM 을 실행합니다.
### --- 상세요구사항
### ------ 1. SLAM 이 동작하고 있는것을 디스플레이로 확인할 수 있어야 합니다. < 대회 중 모니터링을 위해 > 
### ------ 2. SLAM 을 만드는 주기를 선택할 수 있도록 해야합니다. ex. 1초에 한 번, 5초에 한 번, 10초에 한 번 < PATH PLANNING 연산속도에 맞춰 추후 조정을 위해 >
### ------ 3. SLAM 이 ROS 메소드로 작동하는 것을 알고 있는데, function 으로 작동하는 것이 속도가 빠른지 ? SLAM 만을 위한 프로세스를 하나 만드는것이 빠른지 확인
### ---------- 지금 코드에서는 SLAM 이 코드안의 함수로 작동 할 텐데, 잿자에서 그냥 새로운 프로세스로 실행시켜서 파일만 뽑아내고 main_thread.py 에서는 해당 파일을 가져와서 쓰는 것.
### ------ 4. SLAM 으로 뽑아내는 지도는 저장(축적)되어야 합니다.
 
gps_con.Start_getStatus()
imu_con.Start_getStatus()
### GPS와 IMU에서 지속적으로 상태값을 받아옵니다. 새로운 쓰레드로 실행되기 때문에 해당 객체에 지속적으로 값을 업데이트 합니다. 
### --- 상세요구사항
### ------ 1. GPS, IMU 값을 실시간으로 모니터링 할 수 있어야 합니다. 그렇지 않다면 일단 로그라도 작성 할 수 있또록 작성해야합니다. 
### ------ 2. GPS, IMU 값은 현재 좌표와 함께 로그로 작성되양합니다. 로그파일이름 [DEBUG]IMU_20230823_LOG.txt

try:
    while True:
       ### PERCEPTION
       pointcloud = lidar_con.get_pointcloud()
       ### 라이다로부터 point cloud 데이터를 받아옵니다. 
       ### --- 상세요구사항
       ### ------ 1. point cloud 값을 가져오는 주기를 선택할 수 있도록 작성해야 합니다. 마찬가지로 path_motion_planning 에 걸리는 시간을 고려하여야 하니.
       ### ------ 2. point cloud 값은 로그로 저장되어야 합니다. 어떤 형태인지는 모르겠지만, 디버그 용도로 시간과 데이터를 기록해야합니다. 파일이름 [DEBUG]LIDARPC_20230823_LOG.txt

       main_map = decision.getOGMmap(pointcloud)
       ### pointcloud 데이터로부터 2D OGM cost map 을 반환합니다. 
       ### --- 상세요구사항 
       ### ------ 1. 현실의 Scale 과 맞출 수 있도록 지도 크기를 조절 할 수 있어야 합니다. 
       ###         배열 한 칸의 실제거리가 얼마인지 알 수 있어야 한다는 말과 같습니다. 
       ### ------ 2. 출력하는 2D SCALE 에 따라 장애물 크기도 같이 고려되어야 합니다. 
       ###        예를들어 4X4 costmap 이라면 장애물을 [1,1]=1,[0,2]=1 이런식으로 표현 할 수 있는데, 100 X 100 으로 확대된다면 더 많은 공간에 장애물을 표시하는 1이 들어가야 합니다.
    
       
       ### DECISION
       path=decision.pathlanning(main_map)
       motion_plan = decision.motionplanning(path)


       ### CONTROL
       control.setStatus(motion_plan)
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


except KeyboardInterrupt:
    print("####### INTERRUPTED #########")
    
    sys.exit(0)