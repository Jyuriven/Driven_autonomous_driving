# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "main_msg: 2 messages, 0 services")

set(MSG_I_FLAGS "-Imain_msg:/home/driven/Driven_autonomous_driving/ros_package/driven_ros/src/main_msg/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(main_msg_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/driven/Driven_autonomous_driving/ros_package/driven_ros/src/main_msg/msg/jet2ard.msg" NAME_WE)
add_custom_target(_main_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "main_msg" "/home/driven/Driven_autonomous_driving/ros_package/driven_ros/src/main_msg/msg/jet2ard.msg" ""
)

get_filename_component(_filename "/home/driven/Driven_autonomous_driving/ros_package/driven_ros/src/main_msg/msg/g_map.msg" NAME_WE)
add_custom_target(_main_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "main_msg" "/home/driven/Driven_autonomous_driving/ros_package/driven_ros/src/main_msg/msg/g_map.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(main_msg
  "/home/driven/Driven_autonomous_driving/ros_package/driven_ros/src/main_msg/msg/jet2ard.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/main_msg
)
_generate_msg_cpp(main_msg
  "/home/driven/Driven_autonomous_driving/ros_package/driven_ros/src/main_msg/msg/g_map.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/main_msg
)

### Generating Services

### Generating Module File
_generate_module_cpp(main_msg
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/main_msg
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(main_msg_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(main_msg_generate_messages main_msg_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/driven/Driven_autonomous_driving/ros_package/driven_ros/src/main_msg/msg/jet2ard.msg" NAME_WE)
add_dependencies(main_msg_generate_messages_cpp _main_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/driven/Driven_autonomous_driving/ros_package/driven_ros/src/main_msg/msg/g_map.msg" NAME_WE)
add_dependencies(main_msg_generate_messages_cpp _main_msg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(main_msg_gencpp)
add_dependencies(main_msg_gencpp main_msg_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS main_msg_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(main_msg
  "/home/driven/Driven_autonomous_driving/ros_package/driven_ros/src/main_msg/msg/jet2ard.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/main_msg
)
_generate_msg_eus(main_msg
  "/home/driven/Driven_autonomous_driving/ros_package/driven_ros/src/main_msg/msg/g_map.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/main_msg
)

### Generating Services

### Generating Module File
_generate_module_eus(main_msg
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/main_msg
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(main_msg_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(main_msg_generate_messages main_msg_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/driven/Driven_autonomous_driving/ros_package/driven_ros/src/main_msg/msg/jet2ard.msg" NAME_WE)
add_dependencies(main_msg_generate_messages_eus _main_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/driven/Driven_autonomous_driving/ros_package/driven_ros/src/main_msg/msg/g_map.msg" NAME_WE)
add_dependencies(main_msg_generate_messages_eus _main_msg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(main_msg_geneus)
add_dependencies(main_msg_geneus main_msg_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS main_msg_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(main_msg
  "/home/driven/Driven_autonomous_driving/ros_package/driven_ros/src/main_msg/msg/jet2ard.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/main_msg
)
_generate_msg_lisp(main_msg
  "/home/driven/Driven_autonomous_driving/ros_package/driven_ros/src/main_msg/msg/g_map.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/main_msg
)

### Generating Services

### Generating Module File
_generate_module_lisp(main_msg
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/main_msg
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(main_msg_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(main_msg_generate_messages main_msg_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/driven/Driven_autonomous_driving/ros_package/driven_ros/src/main_msg/msg/jet2ard.msg" NAME_WE)
add_dependencies(main_msg_generate_messages_lisp _main_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/driven/Driven_autonomous_driving/ros_package/driven_ros/src/main_msg/msg/g_map.msg" NAME_WE)
add_dependencies(main_msg_generate_messages_lisp _main_msg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(main_msg_genlisp)
add_dependencies(main_msg_genlisp main_msg_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS main_msg_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(main_msg
  "/home/driven/Driven_autonomous_driving/ros_package/driven_ros/src/main_msg/msg/jet2ard.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/main_msg
)
_generate_msg_nodejs(main_msg
  "/home/driven/Driven_autonomous_driving/ros_package/driven_ros/src/main_msg/msg/g_map.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/main_msg
)

### Generating Services

### Generating Module File
_generate_module_nodejs(main_msg
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/main_msg
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(main_msg_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(main_msg_generate_messages main_msg_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/driven/Driven_autonomous_driving/ros_package/driven_ros/src/main_msg/msg/jet2ard.msg" NAME_WE)
add_dependencies(main_msg_generate_messages_nodejs _main_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/driven/Driven_autonomous_driving/ros_package/driven_ros/src/main_msg/msg/g_map.msg" NAME_WE)
add_dependencies(main_msg_generate_messages_nodejs _main_msg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(main_msg_gennodejs)
add_dependencies(main_msg_gennodejs main_msg_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS main_msg_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(main_msg
  "/home/driven/Driven_autonomous_driving/ros_package/driven_ros/src/main_msg/msg/jet2ard.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/main_msg
)
_generate_msg_py(main_msg
  "/home/driven/Driven_autonomous_driving/ros_package/driven_ros/src/main_msg/msg/g_map.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/main_msg
)

### Generating Services

### Generating Module File
_generate_module_py(main_msg
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/main_msg
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(main_msg_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(main_msg_generate_messages main_msg_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/driven/Driven_autonomous_driving/ros_package/driven_ros/src/main_msg/msg/jet2ard.msg" NAME_WE)
add_dependencies(main_msg_generate_messages_py _main_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/driven/Driven_autonomous_driving/ros_package/driven_ros/src/main_msg/msg/g_map.msg" NAME_WE)
add_dependencies(main_msg_generate_messages_py _main_msg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(main_msg_genpy)
add_dependencies(main_msg_genpy main_msg_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS main_msg_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/main_msg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/main_msg
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(main_msg_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/main_msg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/main_msg
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(main_msg_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/main_msg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/main_msg
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(main_msg_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/main_msg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/main_msg
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(main_msg_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/main_msg)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/main_msg\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/main_msg
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(main_msg_generate_messages_py std_msgs_generate_messages_py)
endif()
