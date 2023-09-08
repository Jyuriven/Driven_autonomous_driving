import numpy as np
import math

import rospy
import sensor_msgs.point_cloud2 as pc2
from sensor_msgs.msg import PointCloud2
import argparse

class Convert:
    
scale = 0.1 
width = 100 
height = 100 

map_origin_x = -width / 2 * scale
map_origin_y = -height / 2 * scale

def parse_args():
    
    parser = argparse.ArgumentParser(description='Convert 6DOF output from SLAM to 2D Gridmap for path planning.')
    
    parser.add_argument("--output", type=str, default="data/", help="Save 2D gripmap")
    parser.add_argument("--hz", type=int, default=10, help="Frequency of creating map")
    parser.add_argument("--hz", type=int, default=10, help="Frequency of creating map")
    
    args = parser.parse_args()

    return args


def convert_to_grid_map(x, y, yaw):
    
    map_x = int((x - map_origin_x) / scale)
    map_y = int((y - map_origin_y) / scale)

    if 0 <= map_x < width and 0 <= map_y < height:
        
        print(f"6DOF data to grid map: x={x}, y={y}, yaw={yaw} ===> ({map_x}, {map_y})")
    else:
        print("인덱스 오류")


def pointcloud_callback(msg):
    
    for p in pc2.read_points(msg, field_names=("x", "y", "z"), skip_nans=True):
        x, y, z = p
        print("Point: x={}, y={}, z={}".format(x, y, z))

def subscribe_from_slam():
    
    rospy.init_node("pointcloud_subscriber", anonymous=True)

    topic_name = "/your_topic" # LeGO-LOAM Publish Topic

    rospy.Subscriber(topic_name, PointCloud2, pointcloud_callback) #LeGO-LOAM에서 Publish한 데이터 Subscribe

    rospy.spin() #실행

def main():
    subscribe_from_slam()
    convert_to_grid_map(x, y, yaw)
    
    
if __name__ == "__main__":
    
    try:
        main()
    except rospy.ROSInterruptException:
        print()
        pass