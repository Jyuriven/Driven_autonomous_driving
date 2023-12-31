#!/usr/bin/python3
#-*- coding:utf-8 -*-

import rospy
from sensor_msgs.msg import PointCloud2
import sensor_msgs.point_cloud2 as pc2
import numpy as np
import threading
from cloud_msgs.msg import g_map
from sklearn.cluster import DBSCAN


'''
map_point: imageProjection.cpp에서 publish한 /segmented_cloud_pure 토픽의 메세지를 subscribe하여 만든 넘파이 맵
key_point: mapOptimization.cpp에서 publish한 /key_pose_origin 토픽의 메세지를 subscribe하여 만든 자동차의 좌표값
'''

class Convert:
    def __init__(self):
        rospy.Subscriber("/segmented_cloud_pure", PointCloud2, self.cloud_callback)
        rospy.Subscriber("/key_pose_origin", PointCloud2, self.key_pose_callback)

        self.map_pub = rospy.Publisher("/per2main", g_map, queue_size=1)
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
        self.convert_clustering()
    
    def mapping_idx(self, 
                    x_point,
                    y_point,
                    data,
                    map_size = 30, 
                    filtering = False, 
                    filter_size = 6.0):
        '''
        라이다의 좌표를 리스트로 맵핑을 하기 전에 0-1 값으로 표준화를 해주는 메소드
        True시 정해진 filter 사이즈에 따라서 표준화를 진행 -> 맵 크기에 비해 사이즈가 좀 작아짐
        False시 좌표 값들의 최대, 최소 크기에 따라 표준화를 진행 -> 맵에 꽉차게 맵핑됨
        '''
        
        if filtering is True:
            mapped_x = int((x_point + filter_size) / (2 * filter_size) * (map_size - 1))
            mapped_y = int((y_point + filter_size) / (2 * filter_size) * (map_size - 1))
        else:
            max_size = max(data[:, 0])
            min_size = min(data[:, 0])
            mapped_x = int((x_point - min_size) / (max_size - min_size) * (map_size - 1))
            max_size = max(data[:, 1])
            min_size = min(data[:, 1])
            mapped_y = int((y_point - min_size) / (max_size - min_size) * (map_size - 1))
            
        return mapped_x, mapped_y
    
    def cal_cluster_center(self, unique_labels, labels, data):
        
        cluster_center = []
            
        for label in unique_labels:
            if label != -1:  # -1 는 이상치
                cluster_points = data[labels == label]
                center = np.mean(cluster_points, axis=0)
                cluster_center.append(center)
                
        return cluster_center
    
    def people_filtering(self, data, labels, people_idx):
        '''
        people_idx: data, labels의 인덱스 값인데, z값이 임계치 이상인 좌표들에 대한 인덱스를 모아두었다
        '''
        data = np.delete(data, people_idx, axis=0)
        labels = np.delete(labels, people_idx)
        
        return data, labels
    
    def convert_clustering(self,
                           filter_size = 5.0,
                           map_size = 50,
                           eps = 0.3,
                           min_samples = 4):
        '''
        기존의 맵핑 방식을 DBSCAN을 활용한 클러스터링 방식을 추가하여 콘당 1개의 인덱스에 맵핑.
        '''
        if self.map_point is not None and self.key_point is not None:
            
            # 초기화
            self.x_lst = []
            self.y_lst = []
            x_lst_tmp = []
            y_lst_tmp = []

            dbscan = DBSCAN(eps = eps, min_samples = min_samples)
            
            # 최종 맵
            self.grid_map = [[0]*map_size for i in range(map_size)]
        
            # x, y, z 좌표 값의 최대 최소 값
            max_list = np.apply_along_axis(lambda a: np.max(a), 0, self.map_point)
            min_list = np.apply_along_axis(lambda a: np.min(a), 0, self.map_point)
            print(f'[manual log] [perception] [mapConvert.py]\nmax point x:{max_list[0]} y;{max_list[1]} z:{max_list[2]}\nmin point x:{min_list[0]} y:{min_list[1]} z:{min_list[2]}')
            
            
            
            # 사람으로 추정되는 데이터 인덱스
            people_idx = []
            
            # 이상치와 사람을 필터링
            idx = 0
            for point in self.map_point:
                map_x = point[0]
                map_y = point[1]
                map_z = point[2]
                

                # 맵에 좌표 맵핑
                if (abs(map_x) <= filter_size) and (abs(map_y) <= filter_size):
                    x_lst_tmp.append(map_x)
                    y_lst_tmp.append(map_y)

                    # z축 값을 확인하여 사람 필터링
                    ######## 실험 대상 ########
                    if map_z > 0.70:
                        people_idx.append(idx)
                    idx += 1
 

            # 차의 좌표 _ 거의 (0,0)
            pose_x = self.key_point[0][0]
            pose_y = self.key_point[0][1]
            x_lst_tmp.append(pose_x)
            y_lst_tmp.append(pose_y)

            # 변환 전의 필터링 된 좌표 값
            data_tmp = list(zip(x_lst_tmp, y_lst_tmp))
            data_tmp = np.array(data_tmp)
            people_idx = np.array(people_idx)
            
            if (abs(pose_x) <= filter_size) and (abs(pose_y) <= filter_size):
                # x, y 좌표를 grid_map 인덱스로 변환
                self.car_x, self.car_y = self.mapping_idx(x_point=pose_x, y_point=pose_y, data=data_tmp, map_size=map_size, filtering=False)
                

            # Clustering
            labels = dbscan.fit_predict(data_tmp)
            labels = np.array(labels)
            
            if people_idx.size is not 0:
                # 사람인 좌표들을 필터링
                data_tmp, labels = self.people_filtering(data_tmp, labels, people_idx)
                
            # 유일값
            unique_labels = set(labels)
            cluster_center = self.cal_cluster_center(unique_labels, labels, data_tmp)

            for center in cluster_center:
                x, y = center
                x_idx, y_idx = self.mapping_idx(x_point=x, y_point=y, map_size=map_size, filtering=False, data=data_tmp)
                self.x_lst.append(x_idx)
                self.y_lst.append(y_idx)
                self.grid_map[x_idx][y_idx] = 1
            
             # 자동차
            self.grid_map[self.car_x][self.car_y] = 7
            
            print(f'[manual log] [perception] [mapConvert.py] grid_map:')
            for i in range(50):
                for j in range(50):
                    print(self.grid_map[i][j], end=' ')
                print()
            # save_map = np.array(self.grid_map)
            # np.savetxt('/home/driven/driven/Driven_autonomous_driving/ros_package/driven_ros/src/driven/src/perception/map_50.txt', save_map, fmt='%d')
            

    def map_publish(self):
        msg = g_map()
        
        msg.x_lst = self.x_lst
        msg.y_lst = self.y_lst
        
        msg.car_x = self.car_x
        msg.car_y = self.car_y
        
        if msg.car_x == None or msg.car_y == None :
            msg.car_x = 24
            msg.car_y = 24

        print("")
        self.map_pub.publish(msg)

def main():

    rospy.init_node('mapConvert', anonymous=True)
    rate = rospy.Rate(10)

    convert = Convert()

    while not rospy.is_shutdown():
        convert.map_publish()
        rate.sleep()
        

if __name__ == '__main__':
    try:
        main()
    except rospy.ROSInterruptException:
        print("[manual log] [perception] [mapConvert.py] ROS Exception")
