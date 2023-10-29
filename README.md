<img width="100%" src="img/top.png"/>

# Driven_autonomous_driving

2023 대학생 창작 모빌리티 경진대회 자율주행 부문 한국기술교육대학교 Driven

<details>
<summary>팀 이름이 "바퀴벌레" 인 이유는 ?</summary>
<div markdown="1">
* 이태원에서 진짜 장난안하고 엄지손가락만한 바퀴벌레를 잡았음. 누가 설명좀.
</div>
</details>


[ Driven 자율주행 팀 회고 ](https://h17.notion.site/Driven-2b50e449be874ac5b2acb7312a8bfb48?pvs=4)

[박태정의 대회 후기 글 ](proggg.tistoy.com)

<img width="100%" src="img/driven_main_3.JPG"/>

## Team
| Category_major(Branch) | Category Minor | Developer |
|---|:---:|---:|
|Perception|Lidar|용재|
|         | LEGO_LOAM |용재|
|         | lavacone_detect(yolo) |용재|
|Decision| PATH PLANNING |태정|
|         | Motion Planning |태정|
|Control| Steering calculation |재민|
|       | Velocity calculation |재민|
|Communication| Autonomous System Platfrom |용재,태정|
|Main Process (Node)| Main Process |태정|
|Project Manager |  - | 태정 |

## 구조
End-to-End ROS Melodic System / 3 package / 8 Node
<img width="100%" src="img/driven_main_process.png"/>
``` html

📂 driven_ros_final ( ROS package )
		⏐
		├ 📂 devel
		├ 📂 build
		⎣ 📂 src
				⏐
				├ 📂 driven(pkg)
		        ├ 📂 include(cpp)
				⏐   ├ 📄 CMakeList.txt
				⏐   ├ 📄 package.xml
				⏐   ├ 📂 launch
				⏐   ⏐   ⎣ 📄 .launch
				⏐   ├ 📂 src(python)
				⏐   ⏐   ⏐ 📄 main_thread.py
				⏐   ⏐   ├ 📂 control
				⏐   ⏐   ⏐     ├ 📂 library
				⏐   ⏐   ⏐        ⎣ pid.py
				⏐   ⏐   ├ 📂 perception
				⏐   ⏐   ⏐     ├ 📂 library
				⏐   ⏐   ⏐        ⎣ lidar / yolo
				⏐   ⏐   ├ 📂 decision
				⏐   ⏐   ⏐     ├ 📂 library
				⏐   ⏐   ⏐        ⎣  Motion Planning / Local Path Planning
```

``` html

📂 driven ( code )
		⏐
		├ 📂 Perception
        ⏐   ├ 📂 src(python)
        |   
		├ 📂 Decision
        |  ├ 📂 src(python) 	
        |  ⏐ 📄 main_thread.py
        |   
		⎣ 📂 Control
		   ⏐
		   ├ 📂 src(python)
		   ⏐   ⏐ 📄 main_thread.py

```


## 실행

### 요소별 설명 및 실행
#### Perception

#### Decision

#### Control

## 환경
```ruby

Hardware
---
main_computer : Jetson Xavier AGX H01 <bender>
camera :
lidar : Velodyne puck
gps :
imu :


Software
---
ROS Melodic

python3.7
python2.6

<더 작성해주세요.>


```
## 참고자료
<b>Driven 팀원들이 작성한 wiki 에 참고할만한것들이 있습니다. </b>

자율주행 시스템을 만들고 싶지만, 아무것도 모르는 사람들에게 도움이 될 만한 주제들을 모아봤습니다.

| ROS 는 뭘까 ?  

| ROS 는 어떻게 선택해야 할까 ?

| Driven 이 ROS 를 사용하며 겪었던 문제들  
* ROS package 에 의존성을 추가하는 것은 어떻게 해야할까?
* 한개의 노드에서 여러개의 센서를 한번에 받아 작업하는 것은 구조가 어떻게 되는걸까 ?
* etc...



| Hardware 는 무슨 기준으로 선택했었을까요 ?

| Hardware 는 무슨 기준으로 선택했었을까요 ?
