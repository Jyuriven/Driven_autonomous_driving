cmake_minimum_required(VERSION 2.8.3)
project(main_msg)


find_package(catkin REQUIRED COMPONENTS
  message_generation
  geometry_msgs
  std_msgs

)

add_message_files(
  DIRECTORY msg
  FILES
  jet2ard.msg
  g_map.msg
  det_info.msg
)

generate_messages(
  DEPENDENCIES
 
  std_msgs
 
)


catkin_package(
  CATKIN_DEPENDS 
  message_runtime 
  message_generation
  std_msgs
)

include_directories(
  ${catkin_INCLUDE_DIRS}
)



