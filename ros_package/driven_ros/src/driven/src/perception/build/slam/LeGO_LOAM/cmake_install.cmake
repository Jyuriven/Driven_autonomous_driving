# Install script for directory: /home/driven/Driven_autonomous_driving/ros_package/driven_ros/src/driven/src/perception/src/slam/LeGO_LOAM

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/driven/Driven_autonomous_driving/ros_package/driven_ros/src/driven/src/perception/install")
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
  include("/home/driven/Driven_autonomous_driving/ros_package/driven_ros/src/driven/src/perception/build/slam/LeGO_LOAM/catkin_generated/safe_execute_install.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/driven/Driven_autonomous_driving/ros_package/driven_ros/src/driven/src/perception/build/slam/LeGO_LOAM/catkin_generated/installspace/lego_loam.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lego_loam/cmake" TYPE FILE FILES
    "/home/driven/Driven_autonomous_driving/ros_package/driven_ros/src/driven/src/perception/build/slam/LeGO_LOAM/catkin_generated/installspace/lego_loamConfig.cmake"
    "/home/driven/Driven_autonomous_driving/ros_package/driven_ros/src/driven/src/perception/build/slam/LeGO_LOAM/catkin_generated/installspace/lego_loamConfig-version.cmake"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lego_loam" TYPE FILE FILES "/home/driven/Driven_autonomous_driving/ros_package/driven_ros/src/driven/src/perception/src/slam/LeGO_LOAM/package.xml")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/lego_loam" TYPE PROGRAM FILES "/home/driven/Driven_autonomous_driving/ros_package/driven_ros/src/driven/src/perception/build/slam/LeGO_LOAM/catkin_generated/installspace/mapConvert.py")
endif()

