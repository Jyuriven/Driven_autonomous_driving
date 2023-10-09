# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "detection: 1 messages, 0 services")

set(MSG_I_FLAGS "-Idetection:/home/driven/Driven/Driven_autonomous_driving/ros_package/driven_ros/src/driven/src/perception/src/detection/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(detection_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/driven/Driven/Driven_autonomous_driving/ros_package/driven_ros/src/driven/src/perception/src/detection/msg/det_info.msg" NAME_WE)
add_custom_target(_detection_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "detection" "/home/driven/Driven/Driven_autonomous_driving/ros_package/driven_ros/src/driven/src/perception/src/detection/msg/det_info.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(detection
  "/home/driven/Driven/Driven_autonomous_driving/ros_package/driven_ros/src/driven/src/perception/src/detection/msg/det_info.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/detection
)

### Generating Services

### Generating Module File
_generate_module_cpp(detection
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/detection
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(detection_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(detection_generate_messages detection_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/driven/Driven/Driven_autonomous_driving/ros_package/driven_ros/src/driven/src/perception/src/detection/msg/det_info.msg" NAME_WE)
add_dependencies(detection_generate_messages_cpp _detection_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(detection_gencpp)
add_dependencies(detection_gencpp detection_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS detection_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(detection
  "/home/driven/Driven/Driven_autonomous_driving/ros_package/driven_ros/src/driven/src/perception/src/detection/msg/det_info.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/detection
)

### Generating Services

### Generating Module File
_generate_module_eus(detection
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/detection
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(detection_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(detection_generate_messages detection_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/driven/Driven/Driven_autonomous_driving/ros_package/driven_ros/src/driven/src/perception/src/detection/msg/det_info.msg" NAME_WE)
add_dependencies(detection_generate_messages_eus _detection_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(detection_geneus)
add_dependencies(detection_geneus detection_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS detection_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(detection
  "/home/driven/Driven/Driven_autonomous_driving/ros_package/driven_ros/src/driven/src/perception/src/detection/msg/det_info.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/detection
)

### Generating Services

### Generating Module File
_generate_module_lisp(detection
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/detection
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(detection_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(detection_generate_messages detection_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/driven/Driven/Driven_autonomous_driving/ros_package/driven_ros/src/driven/src/perception/src/detection/msg/det_info.msg" NAME_WE)
add_dependencies(detection_generate_messages_lisp _detection_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(detection_genlisp)
add_dependencies(detection_genlisp detection_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS detection_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(detection
  "/home/driven/Driven/Driven_autonomous_driving/ros_package/driven_ros/src/driven/src/perception/src/detection/msg/det_info.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/detection
)

### Generating Services

### Generating Module File
_generate_module_nodejs(detection
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/detection
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(detection_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(detection_generate_messages detection_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/driven/Driven/Driven_autonomous_driving/ros_package/driven_ros/src/driven/src/perception/src/detection/msg/det_info.msg" NAME_WE)
add_dependencies(detection_generate_messages_nodejs _detection_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(detection_gennodejs)
add_dependencies(detection_gennodejs detection_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS detection_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(detection
  "/home/driven/Driven/Driven_autonomous_driving/ros_package/driven_ros/src/driven/src/perception/src/detection/msg/det_info.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/detection
)

### Generating Services

### Generating Module File
_generate_module_py(detection
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/detection
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(detection_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(detection_generate_messages detection_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/driven/Driven/Driven_autonomous_driving/ros_package/driven_ros/src/driven/src/perception/src/detection/msg/det_info.msg" NAME_WE)
add_dependencies(detection_generate_messages_py _detection_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(detection_genpy)
add_dependencies(detection_genpy detection_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS detection_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/detection)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/detection
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(detection_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/detection)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/detection
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(detection_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/detection)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/detection
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(detection_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/detection)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/detection
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(detection_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/detection)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/detection\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/detection
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(detection_generate_messages_py std_msgs_generate_messages_py)
endif()
