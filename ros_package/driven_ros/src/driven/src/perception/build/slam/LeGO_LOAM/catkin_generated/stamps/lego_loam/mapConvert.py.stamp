#!/usr/bin/python
#-*- coding:utf-8 -*-

import rospy
from sensor_msgs.msg import PointCloud2
import sensor_msgs.point_cloud2 as pc2
import numpy as np
import threading
from cloud_msgs.msg import map

'''
map_point: imageProjection.cpp에서 publish한 /segmented_cloud_pure 토픽의 메세지를 subscribe하여 만든 넘파이 맵
key_point: mapOptimization.cpp에서 publish한 /key_pose_origin 토픽의 메세지를 subscribe하여 만든 자동차의 좌표값
'''

class Convert:
    def __init__(self):
        rospy.Subscriber("/segmented_cloud_pure", PointCloud2, self.cloud_callback)
        rospy.Subscriber("/key_pose_origin", PointCloud2, self.key_pose_callback)

        self.map_pub = rospy.Publisher("/per2main", map, queue_size=1)
        self.map_point = None
        self.key_point = None
        self.grid_map = None
        self.x_lst = []
        self.y_lst = []
        self.car_x = None
        self.car_y = None

    def cloud_callback(self, msg):
    
        pc_data = pc2.read_points(msg, field_names=("x", "y", "z"), skip_nans=True)
        self.map_point = np.array([p[:3] for p in pc_data])
        
    
    def key_pose_callback(self, msg):
    
        pc_data = pc2.read_points(msg, field_names=("x", "y", "z"), skip_nans=True)
        self.key_point = np.array([p[:3] for p in pc_data])
        self.convert()
    
    def convert(self):
        
        if self.map_point is not None and self.key_point is not None:
            
            self.x_lst = []
            self.y_lst = []

            # Optimization
            map_size = 50
            filter_size = 7.0
        
            # 최종 맵
            self.grid_map = [[' ']*map_size for i in range(map_size)]
        
            # x, y, z 좌표 값의 최대 최소 값
            max_list = np.apply_along_axis(lambda a: np.max(a), 0, self.map_point)
            min_list = np.apply_along_axis(lambda a: np.min(a), 0, self.map_point)
            print(f'max point:{max_list[0]}  {max_list[1]}    {max_list[2]}')
            print(f'min point:{min_list[0]}  {min_list[1]}    {min_list[2]}')
            
            pose_x = self.key_point[0][0]
            pose_y = self.key_point[0][1]
            # 맵에 차 위치 맵핑
            if (-filter_size <= pose_x <= filter_size) and (-filter_size <= pose_y <= filter_size):
                # x, y 좌표를 grid_map 인덱스로 변환
                x_idx = int((pose_x + filter_size) / (2 * filter_size) * (map_size - 1))
                y_idx = int((pose_y + filter_size) / (2 * filter_size) * (map_size - 1))

                self.car_x = x_idx
                self.car_y = y_idx
            
            for point in self.map_point:
                map_x = point[0]
                map_y = point[1]
                map_z = point[2]
            
                if map_z > 0.58:
                    continue

                # 맵에 좌표 맵핑
                if (-filter_size <= map_x <= filter_size) and (-filter_size <= map_y <= filter_size):
                    # x, y 좌표를 grid_map 인덱스로 변환
                    x_idx = int((map_x + filter_size) / (2 * filter_size) * (map_size - 1))
                    y_idx = int((map_y + filter_size) / (2 * filter_size) * (map_size - 1))
                    
                    if y_idx > self.car_y:
                        self.x_lst.append(x_idx)
                        self.y_lst.append(y_idx)

                        # 장애물
                        self.grid_map[x_idx][y_idx] = 0

        
             # 자동차
            self.grid_map[self.car_x][self.car_y] = 7
            
        for i in range(50):
            for j in range(50):
                print(self.grid_map[i][j], end=' ')
            print()
        # print(f'length of x,y lis: {len(self.x_lst)}, {len(self.y_lst)}')

    def map_publish(self):
        msg = map()
        
        msg.x_lst = self.x_lst
        msg.y_lst = self.y_lst
        
        msg.car_x = self.car_x
        msg.car_y = self.car_y
        
        if msg.car_x == None or msg.car_y == None :
            msg.car_x = 24
            msg.car_y = 24


        self.map_pub.publish(msg)
        print('map published')

def main():

    
    rospy.init_node('mapConvert', anonymous=True)
    rate = rospy.Rate(5)

    convert = Convert()

    while not rospy.is_shutdown():
        convert.map_publish()
        rate.sleep()
        

if __name__ == '__main__':
    try:
        main()
    except rospy.ROSInterruptException:
        pass

