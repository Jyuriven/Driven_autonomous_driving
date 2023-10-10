# Install script for directory: /home/driven/Driven/Driven_autonomous_driving/ros_package/driven_ros/src/driven/src/control/gps/src/ublox_f9p/ntrip_ros

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/driven/Driven/Driven_autonomous_driving/ros_package/driven_ros/src/driven/src/control/gps/install")
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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/driven/Driven/Driven_autonomous_driving/ros_package/driven_ros/src/driven/src/control/gps/build/ublox_f9p/ntrip_ros/catkin_generated/installspace/ntrip_ros.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ntrip_ros/cmake" TYPE FILE FILES
    "/home/driven/Driven/Driven_autonomous_driving/ros_package/driven_ros/src/driven/src/control/gps/build/ublox_f9p/ntrip_ros/catkin_generated/installspace/ntrip_rosConfig.cmake"
    "/home/driven/Driven/Driven_autonomous_driving/ros_package/driven_ros/src/driven/src/control/gps/build/ublox_f9p/ntrip_ros/catkin_generated/installspace/ntrip_rosConfig-version.cmake"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ntrip_ros" TYPE FILE FILES "/home/driven/Driven/Driven_autonomous_driving/ros_package/driven_ros/src/driven/src/control/gps/src/ublox_f9p/ntrip_ros/package.xml")
endif()

