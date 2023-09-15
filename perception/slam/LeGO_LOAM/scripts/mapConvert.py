#!/usr/bin/env python3

import rospy
from sensor_msgs.msg import PointCloud2
import sensor_msgs.point_cloud2 as pc2
import numpy as np

map_point = None
key_point = None

def cloud_callback(msg):
    global map_point
    
    pc_data = pc2.read_points(msg, field_names=("x", "y", "z"), skip_nans=True)
    map_point = np.array([p[:3] for p in pc_data])
    
def key_pose_origin_callback(msg):
    global key_point
    
    pc_data = pc2.read_points(msg, field_names=("x", "y", "z"), skip_nans=True)
    key_point = np.array([p[:3] for p in pc_data])

def convert():
    global map_point
    global key_point
     # 최종 맵
    grid_map = [['.']*30 for i in range(30)]
    
    # x, y, z 좌표 값의 최대 최소 값
    max_list = np.apply_along_axis(lambda a: np.max(a), 0, map_point)
    min_list = np.apply_along_axis(lambda a: np.min(a), 0, map_point)
    
    
    for point, pose in map_point, key_point:
        x = point[0]
        y = point[1]
        pose_x = pose[0]
        pose_y = pose[1]
        
        # 맵에 좌표 맵핑
        if (-30.0 <= x <= 30.0) and (-30.0 <= y <= 30.0):
            # x, y 좌표를 grid_map 인덱스로 변환
            x_idx = int((x - min_list[0]) / (max_list[0] - min_list[0]) * 29)
            y_idx = int((y - min_list[1]) / (max_list[1] - min_list[1]) * 29)
            
            # 해당 좌표에 값을 1로 설정
            grid_map[x_idx][y_idx] = 1
        
        # 맵에 차 위치 맵핑
        if (-30.0 <= pose_x <= 30.0) and (-30.0 <= pose_y <= 30.0):
            # x, y 좌표를 grid_map 인덱스로 변환
            x_idx = int((x - min_list[0]) / (max_list[0] - min_list[0]) * 29)
            y_idx = int((y - min_list[1]) / (max_list[1] - min_list[1]) * 29)
            
            # 해당 좌표에 값을 1로 설정
            grid_map[x_idx][y_idx] = 8
        

    print(f'\nMAP:\n{grid_map}')
    
def main():
    rospy.init_node('mapConvert', anonymous=True)
    rospy.Subscriber("/segmented_cloud_pure", PointCloud2, cloud_callback)
    rospy.Subscriber("/key_pose_origin", PointCloud2, key_pose_origin_callback)
    grid_map = convert()
    
    rospy.spin()

if __name__ == '__main__':
    main()
