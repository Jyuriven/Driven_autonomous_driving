## Driven 자율주행 시스템 실행 방법 

### 1. Lidar 와 LEGO-LOAM 실행
    * 1-0. cd src/perception/
    * 1-1. source devel/setup.bash
    * 1-2. catkin_make -j1
    * 1-3. rosluanch velodyne_pointcloud VLP16_points.launch
    * 1-4. rosluanch lego_loam run.launch

### 2. main_thread 실행 [ 새로운 터미널 ]
    * 2-0. cd ros_package/driven/
    * 2-1. source devel/setup.bash
    * 2-2. rosrun driven main_thread.py

### 3. GPS 는 아직 어케할지모름 ! 