#!/usr/bin/env python3

import rospy
from sensor_msgs.msg import PointCloud2
import sensor_msgs.point_cloud2 as pc2
import numpy as np

def cloud_callback(msg):
    pc_data = pc2.read_points(msg, field_names=("x", "y", "z"), skip_nans=True)
    point_cloud = np.array([p[:3] for p in pc_data])
    
    # 최종 맵
    grid_map = [[0]*50 for i in range(50)]
    
    # x, y, z 좌표 값의 최대 최소 값
    max_list = np.apply_along_axis(lambda a: np.max(a), 0, point_cloud)
    min_list = np.apply_along_axis(lambda a: np.min(a), 0, point_cloud)
    
    for point in point_cloud:
        x = point[0]
        y = point[1]
        
        # 맵에 좌표 맵핑
        if (min_list[0] <= x <= max_list[0]) and (min_list[1] <= y <= max_list[1]):
            # x, y 좌표를 grid_map 인덱스로 변환
            x_idx = int((x - min_list[0]) / (max_list[0] - min_list[0]) * 49)
            y_idx = int((y - min_list[1]) / (max_list[1] - min_list[1]) * 49)
            
            # 해당 좌표에 값을 1로 설정
            grid_map[x_idx][y_idx] = 1

    print(f'MAP:\n{grid_map}')

def main():
    rospy.init_node('mapConvert', anonymous=True)
    rospy.Subscriber("/segmented_cloud_pure", PointCloud2, cloud_callback)
    print('python 들어왔음.')
    rospy.spin()

if __name__ == '__main__':
    main()
