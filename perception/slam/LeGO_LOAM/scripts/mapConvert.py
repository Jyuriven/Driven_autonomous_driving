#!/usr/bin/env python3

import rospy
from sensor_msgs.msg import PointCloud2
import sensor_msgs.point_cloud2 as pc2
import numpy as np
import threading

'''
map_point: imageProjection.cpp에서 publish한 /segmented_cloud_pure 토픽의 메세지를 subscribe하여 만든 넘파이 맵
key_point: mapOptimization.cpp에서 publish한 /key_pose_origin 토픽의 메세지를 subscribe하여 만든 자동차의 좌표값
'''
map_point = None
key_point = None
grid_map = None

map_lock = threading.Lock()
key_lock = threading.Lock()

def cloud_callback(msg):
    global map_point
    
    pc_data = pc2.read_points(msg, field_names=("x", "y", "z"), skip_nans=True)
    map_point = np.array([p[:3] for p in pc_data])
    print('map renewal\n')
    # convert()
    
def key_pose_callback(msg):
    global key_point
    
    pc_data = pc2.read_points(msg, field_names=("x", "y", "z"), skip_nans=True)
    key_point = np.array([p[:3] for p in pc_data])
    print('key renewal\n')
    convert()
    
def convert():
    global map_point
    global key_point
    global grid_map
    
    if map_point is not None and key_point is not None:
        
        # Optimization
        map_size = 20
        filter_size = 20.0
        
        # 최종 맵
        grid_map = [[1]*map_size for i in range(map_size)]
        
        # x, y, z 좌표 값의 최대 최소 값
        max_list = np.apply_along_axis(lambda a: np.max(a), 0, map_point)
        min_list = np.apply_along_axis(lambda a: np.min(a), 0, map_point)
        print(f'max point:{max_list[0]}  {max_list[1]}\n')
        print(f'min point:{min_list[0]}  {min_list[1]}\n')
        
        for point in map_point:
            map_x = point[0]
            map_y = point[1]
            
            # 맵에 좌표 맵핑
            if (-filter_size <= map_x <= filter_size) and (-filter_size <= map_y <= filter_size):
                # x, y 좌표를 grid_map 인덱스로 변환
                # x_idx = int((map_x - min_list[0]) / (max_list[0] - min_list[0]) * 29)
                # y_idx = int((map_y - min_list[1]) / (max_list[1] - min_list[1]) * 29)
                x_idx = int((map_x + filter_size) / (2 * filter_size) * (map_size - 1))
                y_idx = int((map_y + filter_size) / (2 * filter_size) * (map_size - 1))

                # 장애물
                grid_map[x_idx][y_idx] = 0
            
        
        pose_x = key_point[0][0]
        pose_y = key_point[0][1]
        
        # 맵에 차 위치 맵핑
        if (-filter_size <= pose_x <= filter_size) and (-filter_size <= pose_y <= filter_size):
            # x, y 좌표를 grid_map 인덱스로 변환
            # x_idx = int((pose_x - min_list[0]) / (max_list[0] - min_list[0]) * 29)
            # y_idx = int((pose_y - min_list[1]) / (max_list[1] - min_list[1]) * 29)
            x_idx = int((pose_x + filter_size) / (2 * filter_size) * (map_size - 1))
            y_idx = int((pose_y + filter_size) / (2 * filter_size) * (map_size - 1))

            # 자동차
            grid_map[x_idx][y_idx] = 7
            

        print(f'\nMAP:\n{grid_map}')
        
def getOGMmap():
    if grid_map is not None:
        return grid_map
    else:
        print('Map is Empty')

def main():
    rospy.init_node('mapConvert', anonymous=True)
    rospy.Subscriber("/segmented_cloud_pure", PointCloud2, cloud_callback)
    rospy.Subscriber("/key_pose_origin", PointCloud2, key_pose_callback)
    
    # 주기 설정
    rate = rospy.Rate(5)
    while not rospy.is_shutdown():
        rate.sleep()

if __name__ == '__main__':
    main()
