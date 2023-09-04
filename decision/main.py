import library.mapping_ as MAP
import library.MotionPlanner as MotionPlanner
import library.gradient as gradient
import pyastar2d
import numpy as np
from time import sleep
from os import sys

import matplotlib.pyplot as plt


## pesudo code 먼저 작성 함. 
## 큰 틀은 라이다 연결 -> 빈 지도 생성 -> point cloud data to grid 변환 ->grid 저장
## 만들어진 그리드 지도에서 A* 알고리즘 실행 -> 경로 계획 < 이 부분은 좀 더 알아봐야 함. >


### 논의 해봐야 할 점 
## 경로 계획 결과를 전달하면 되는걸까 ? 논의해봐야할점

#lidar_ip = '127,0.0.1'
#lidar_port = 8080

motion_controller = MotionPlanner.MotionPlanner()
#lidar_connection = Lidar.LidarConnection()
#udp_connection = UDP.UDPConnection()

RES = 10
WIDTH = 100
HEIGH = 100

#main_grid = MAP.init_root_grid(HEIGH,WIDTH,RES)
main_grid = np.ones((100,100),np.float32)
print("size of Grid : ",WIDTH*HEIGH)

MAIN_GRID_SET = 1

def pathplanning(path,start_x,start_y,goal_x,goal_y):
    ### slam 을 통해 일반지도를 입력받아 smoothing 된 path 를 반환합니다. 
    ### path 를 기반으로 모션계획합니다.
    ### 반환 된 smoothing path 는 motion planning 에 사용됩니다.
    print("input path is ",path)
    smoothing_path =gradient.smooth(path)
    return smoothing_path



if __name__ == '__main__':
    try:
        while True:
            ## 라이다 데이터를 받아옴. ( x,y,z 좌표 )
            ## 포인트 클라우드를 Grid 에 추가시킴
            ## png 로 저장함.

            #measurment = lidar_connection.recieve_lidar_dist()
            #x_veh,z_veh,heading = udp_connection.get_vehicle_info() ## 차량에 대한 정보를 가져온다. 

            #point_cloud = MAP.measurement_cloud_to_grid() # 해당 메소드 미완성
            #main_grid = MAP.point_cloud_to_grid() ## np.float32 array
            

            ### 시작지점과 
            start = [0,0]  ## 임의 지정 SET
            goal = [67,89]  ## 임의 지정 SET 
        
            ### SLAM 을 통한 OGM 상 현재위치 가져오는 함수 필요 함. ### 
            
            if MAIN_GRID_SET == 1: ## main grid 가 Array 형식이면 
                path = pyastar2d.astar_path(main_grid, start, goal, allow_diagonal=True)

            else:
                print("Using maze solver.py")

            print(path)
            target_d = motion_controller.calculate_target_degree(path)
            smoothing_path = gradient.smooth(path)
            print(smoothing_path)

            plt.plot(smoothing_path)
            plt.show()
            break

            
            ## taregt_d,velocity 아두이노로 전송하기.        
            ## velocity 가 너무 빠른상태에서 steering 이 되지 않아야 함.



    except KeyboardInterrupt:
        print("####### INTERRUPTED #########")
        MAP.save_grid(path,"main_grid")
        sys.exit(0)