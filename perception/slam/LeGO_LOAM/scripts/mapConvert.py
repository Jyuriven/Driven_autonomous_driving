#!/usr/bin/env python3

import rospy
from sensor_msgs.msg import PointCloud2
import sensor_msgs.point_cloud2 as pc2
import numpy as np

def cloud_callback(msg):
    pc_data = pc2.read_points(msg, field_names=("x", "y", "z"), skip_nans=True)
    point_cloud = np.array([p[:3] for p in pc_data])

    print(f'array:::::{point_cloud}')

def main():
    rospy.init_node('mapConvert', anonymous=True)
    rospy.Subscriber("/segmented_cloud_pure", PointCloud2, cloud_callback)
    print('python 들어왔음.')
    rospy.spin()

if __name__ == '__main__':
    main()
