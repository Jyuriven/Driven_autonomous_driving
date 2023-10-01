# Install script for directory: /home/driven/driven/Driven_autonomous_driving/ros_package/driven_ros/src/driven/src/perception/src/slam/cloud_msgs

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/driven/driven/Driven_autonomous_driving/ros_package/driven_ros/src/driven/src/perception/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/cloud_msgs/msg" TYPE FILE FILES
    "/home/driven/driven/Driven_autonomous_driving/ros_package/driven_ros/src/driven/src/perception/src/slam/cloud_msgs/msg/cloud_info.msg"
    "/home/driven/driven/Driven_autonomous_driving/ros_package/driven_ros/src/driven/src/perception/src/slam/cloud_msgs/msg/map.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/cloud_msgs/cmake" TYPE FILE FILES "/home/driven/driven/Driven_autonomous_driving/ros_package/driven_ros/src/driven/src/perception/build/slam/cloud_msgs/catkin_generated/installspace/cloud_msgs-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/driven/driven/Driven_autonomous_driving/ros_package/driven_ros/src/driven/src/perception/devel/include/cloud_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/driven/driven/Driven_autonomous_driving/ros_package/driven_ros/src/driven/src/perception/devel/share/roseus/ros/cloud_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/driven/driven/Driven_autonomous_driving/ros_package/driven_ros/src/driven/src/perception/devel/share/common-lisp/ros/cloud_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/driven/driven/Driven_autonomous_driving/ros_package/driven_ros/src/driven/src/perception/devel/share/gennodejs/ros/cloud_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python2" -m compileall "/home/driven/driven/Driven_autonomous_driving/ros_package/driven_ros/src/driven/src/perception/devel/lib/python2.7/dist-packages/cloud_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/driven/driven/Driven_autonomous_driving/ros_package/driven_ros/src/driven/src/perception/devel/lib/python2.7/dist-packages/cloud_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/driven/driven/Driven_autonomous_driving/ros_package/driven_ros/src/driven/src/perception/build/slam/cloud_msgs/catkin_generated/installspace/cloud_msgs.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/cloud_msgs/cmake" TYPE FILE FILES "/home/driven/driven/Driven_autonomous_driving/ros_package/driven_ros/src/driven/src/perception/build/slam/cloud_msgs/catkin_generated/installspace/cloud_msgs-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/cloud_msgs/cmake" TYPE FILE FILES
    "/home/driven/driven/Driven_autonomous_driving/ros_package/driven_ros/src/driven/src/perception/build/slam/cloud_msgs/catkin_generated/installspace/cloud_msgsConfig.cmake"
    "/home/driven/driven/Driven_autonomous_driving/ros_package/driven_ros/src/driven/src/perception/build/slam/cloud_msgs/catkin_generated/installspace/cloud_msgsConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/cloud_msgs" TYPE FILE FILES "/home/driven/driven/Driven_autonomous_driving/ros_package/driven_ros/src/driven/src/perception/src/slam/cloud_msgs/package.xml")
endif()

