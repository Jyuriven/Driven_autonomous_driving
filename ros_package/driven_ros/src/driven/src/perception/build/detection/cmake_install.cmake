# Install script for directory: /home/driven/Driven/Driven_autonomous_driving/ros_package/driven_ros/src/driven/src/perception/src/detection

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/driven/Driven/Driven_autonomous_driving/ros_package/driven_ros/src/driven/src/perception/install")
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

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/detection/msg" TYPE FILE FILES "/home/driven/Driven/Driven_autonomous_driving/ros_package/driven_ros/src/driven/src/perception/src/detection/msg/det_info.msg")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/detection/cmake" TYPE FILE FILES "/home/driven/Driven/Driven_autonomous_driving/ros_package/driven_ros/src/driven/src/perception/build/detection/catkin_generated/installspace/detection-msg-paths.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/driven/Driven/Driven_autonomous_driving/ros_package/driven_ros/src/driven/src/perception/devel/include/detection")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/driven/Driven/Driven_autonomous_driving/ros_package/driven_ros/src/driven/src/perception/devel/share/roseus/ros/detection")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/driven/Driven/Driven_autonomous_driving/ros_package/driven_ros/src/driven/src/perception/devel/share/common-lisp/ros/detection")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/driven/Driven/Driven_autonomous_driving/ros_package/driven_ros/src/driven/src/perception/devel/share/gennodejs/ros/detection")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python2" -m compileall "/home/driven/Driven/Driven_autonomous_driving/ros_package/driven_ros/src/driven/src/perception/devel/lib/python2.7/dist-packages/detection")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/driven/Driven/Driven_autonomous_driving/ros_package/driven_ros/src/driven/src/perception/devel/lib/python2.7/dist-packages/detection")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/driven/Driven/Driven_autonomous_driving/ros_package/driven_ros/src/driven/src/perception/build/detection/catkin_generated/installspace/detection.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/detection/cmake" TYPE FILE FILES "/home/driven/Driven/Driven_autonomous_driving/ros_package/driven_ros/src/driven/src/perception/build/detection/catkin_generated/installspace/detection-msg-extras.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/detection/cmake" TYPE FILE FILES
    "/home/driven/Driven/Driven_autonomous_driving/ros_package/driven_ros/src/driven/src/perception/build/detection/catkin_generated/installspace/detectionConfig.cmake"
    "/home/driven/Driven/Driven_autonomous_driving/ros_package/driven_ros/src/driven/src/perception/build/detection/catkin_generated/installspace/detectionConfig-version.cmake"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/detection" TYPE FILE FILES "/home/driven/Driven/Driven_autonomous_driving/ros_package/driven_ros/src/driven/src/perception/src/detection/package.xml")
endif()

