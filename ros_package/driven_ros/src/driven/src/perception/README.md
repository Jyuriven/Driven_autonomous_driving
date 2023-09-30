## 자율주행 시스템의 Perception Part
- Camera
- LiDAR
- SLAM


## How to launch perception package

### 1. source devel/setup.bash
### 2. catkin_make -j1
### 3. rosluanch velodyne_pointcloud VLP16_points.launch
### 4. rosluanch lego_loam run.launch