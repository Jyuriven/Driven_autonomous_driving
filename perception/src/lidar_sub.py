#!/usr/bin/env python
import rospy
from sensor_msgs.msg import PointCloud2
from lego_loam import run_le_go_loam

def lidar_callback(data):
    print(data)
    run_le_go_loam(data)

def lidar_subscriber():
    rospy.init_node('slam_processor', anonymous=True)
    lidar_topic = '/slam'

    # Publisher: LiDAR to SLAM
    # 10Hz에서는 queue_size를 1~3으로 진행
    lidar_publisher = rospy.Publisher(lidar_topic, PointCloud2, queue_size=1)

    # Subscriber: LiDAR data
    rospy.Subscriber('/velodyne_points', PointCloud2, lidar_callback)

    # 1초에 10번 실행 -> LeGO-LOAM이 10Hz로 데이터를 받음
    rate = rospy.Rate(10)
    while not rospy.is_shutdown():
        lidar_data = _
        # Publish
        lidar_publisher.publish(lidar_data)
        rate.sleep()

if __name__ == '__main__':
    try:
        lidar_subscriber()
    except rospy.ROSInterruptException:
        print("Interrupt Error:: lidar_sub.py")
        pass
