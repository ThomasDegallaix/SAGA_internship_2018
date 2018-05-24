# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "thorvald_sprayer: 2 messages, 1 services")

set(MSG_I_FLAGS "-Ithorvald_sprayer:/home/thomasdegallaix-ubuntu/catkin_ws/src/thorvald_sprayer/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(thorvald_sprayer_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/thomasdegallaix-ubuntu/catkin_ws/src/thorvald_sprayer/srv/sprayer_controller.srv" NAME_WE)
add_custom_target(_thorvald_sprayer_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "thorvald_sprayer" "/home/thomasdegallaix-ubuntu/catkin_ws/src/thorvald_sprayer/srv/sprayer_controller.srv" ""
)

get_filename_component(_filename "/home/thomasdegallaix-ubuntu/catkin_ws/src/thorvald_sprayer/msg/CANFrame.msg" NAME_WE)
add_custom_target(_thorvald_sprayer_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "thorvald_sprayer" "/home/thomasdegallaix-ubuntu/catkin_ws/src/thorvald_sprayer/msg/CANFrame.msg" ""
)

get_filename_component(_filename "/home/thomasdegallaix-ubuntu/catkin_ws/src/thorvald_sprayer/msg/feedbackData.msg" NAME_WE)
add_custom_target(_thorvald_sprayer_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "thorvald_sprayer" "/home/thomasdegallaix-ubuntu/catkin_ws/src/thorvald_sprayer/msg/feedbackData.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(thorvald_sprayer
  "/home/thomasdegallaix-ubuntu/catkin_ws/src/thorvald_sprayer/msg/feedbackData.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/thorvald_sprayer
)
_generate_msg_cpp(thorvald_sprayer
  "/home/thomasdegallaix-ubuntu/catkin_ws/src/thorvald_sprayer/msg/CANFrame.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/thorvald_sprayer
)

### Generating Services
_generate_srv_cpp(thorvald_sprayer
  "/home/thomasdegallaix-ubuntu/catkin_ws/src/thorvald_sprayer/srv/sprayer_controller.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/thorvald_sprayer
)

### Generating Module File
_generate_module_cpp(thorvald_sprayer
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/thorvald_sprayer
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(thorvald_sprayer_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(thorvald_sprayer_generate_messages thorvald_sprayer_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/thomasdegallaix-ubuntu/catkin_ws/src/thorvald_sprayer/srv/sprayer_controller.srv" NAME_WE)
add_dependencies(thorvald_sprayer_generate_messages_cpp _thorvald_sprayer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/thomasdegallaix-ubuntu/catkin_ws/src/thorvald_sprayer/msg/CANFrame.msg" NAME_WE)
add_dependencies(thorvald_sprayer_generate_messages_cpp _thorvald_sprayer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/thomasdegallaix-ubuntu/catkin_ws/src/thorvald_sprayer/msg/feedbackData.msg" NAME_WE)
add_dependencies(thorvald_sprayer_generate_messages_cpp _thorvald_sprayer_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(thorvald_sprayer_gencpp)
add_dependencies(thorvald_sprayer_gencpp thorvald_sprayer_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS thorvald_sprayer_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(thorvald_sprayer
  "/home/thomasdegallaix-ubuntu/catkin_ws/src/thorvald_sprayer/msg/feedbackData.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/thorvald_sprayer
)
_generate_msg_eus(thorvald_sprayer
  "/home/thomasdegallaix-ubuntu/catkin_ws/src/thorvald_sprayer/msg/CANFrame.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/thorvald_sprayer
)

### Generating Services
_generate_srv_eus(thorvald_sprayer
  "/home/thomasdegallaix-ubuntu/catkin_ws/src/thorvald_sprayer/srv/sprayer_controller.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/thorvald_sprayer
)

### Generating Module File
_generate_module_eus(thorvald_sprayer
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/thorvald_sprayer
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(thorvald_sprayer_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(thorvald_sprayer_generate_messages thorvald_sprayer_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/thomasdegallaix-ubuntu/catkin_ws/src/thorvald_sprayer/srv/sprayer_controller.srv" NAME_WE)
add_dependencies(thorvald_sprayer_generate_messages_eus _thorvald_sprayer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/thomasdegallaix-ubuntu/catkin_ws/src/thorvald_sprayer/msg/CANFrame.msg" NAME_WE)
add_dependencies(thorvald_sprayer_generate_messages_eus _thorvald_sprayer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/thomasdegallaix-ubuntu/catkin_ws/src/thorvald_sprayer/msg/feedbackData.msg" NAME_WE)
add_dependencies(thorvald_sprayer_generate_messages_eus _thorvald_sprayer_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(thorvald_sprayer_geneus)
add_dependencies(thorvald_sprayer_geneus thorvald_sprayer_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS thorvald_sprayer_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(thorvald_sprayer
  "/home/thomasdegallaix-ubuntu/catkin_ws/src/thorvald_sprayer/msg/feedbackData.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/thorvald_sprayer
)
_generate_msg_lisp(thorvald_sprayer
  "/home/thomasdegallaix-ubuntu/catkin_ws/src/thorvald_sprayer/msg/CANFrame.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/thorvald_sprayer
)

### Generating Services
_generate_srv_lisp(thorvald_sprayer
  "/home/thomasdegallaix-ubuntu/catkin_ws/src/thorvald_sprayer/srv/sprayer_controller.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/thorvald_sprayer
)

### Generating Module File
_generate_module_lisp(thorvald_sprayer
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/thorvald_sprayer
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(thorvald_sprayer_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(thorvald_sprayer_generate_messages thorvald_sprayer_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/thomasdegallaix-ubuntu/catkin_ws/src/thorvald_sprayer/srv/sprayer_controller.srv" NAME_WE)
add_dependencies(thorvald_sprayer_generate_messages_lisp _thorvald_sprayer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/thomasdegallaix-ubuntu/catkin_ws/src/thorvald_sprayer/msg/CANFrame.msg" NAME_WE)
add_dependencies(thorvald_sprayer_generate_messages_lisp _thorvald_sprayer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/thomasdegallaix-ubuntu/catkin_ws/src/thorvald_sprayer/msg/feedbackData.msg" NAME_WE)
add_dependencies(thorvald_sprayer_generate_messages_lisp _thorvald_sprayer_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(thorvald_sprayer_genlisp)
add_dependencies(thorvald_sprayer_genlisp thorvald_sprayer_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS thorvald_sprayer_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(thorvald_sprayer
  "/home/thomasdegallaix-ubuntu/catkin_ws/src/thorvald_sprayer/msg/feedbackData.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/thorvald_sprayer
)
_generate_msg_nodejs(thorvald_sprayer
  "/home/thomasdegallaix-ubuntu/catkin_ws/src/thorvald_sprayer/msg/CANFrame.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/thorvald_sprayer
)

### Generating Services
_generate_srv_nodejs(thorvald_sprayer
  "/home/thomasdegallaix-ubuntu/catkin_ws/src/thorvald_sprayer/srv/sprayer_controller.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/thorvald_sprayer
)

### Generating Module File
_generate_module_nodejs(thorvald_sprayer
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/thorvald_sprayer
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(thorvald_sprayer_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(thorvald_sprayer_generate_messages thorvald_sprayer_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/thomasdegallaix-ubuntu/catkin_ws/src/thorvald_sprayer/srv/sprayer_controller.srv" NAME_WE)
add_dependencies(thorvald_sprayer_generate_messages_nodejs _thorvald_sprayer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/thomasdegallaix-ubuntu/catkin_ws/src/thorvald_sprayer/msg/CANFrame.msg" NAME_WE)
add_dependencies(thorvald_sprayer_generate_messages_nodejs _thorvald_sprayer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/thomasdegallaix-ubuntu/catkin_ws/src/thorvald_sprayer/msg/feedbackData.msg" NAME_WE)
add_dependencies(thorvald_sprayer_generate_messages_nodejs _thorvald_sprayer_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(thorvald_sprayer_gennodejs)
add_dependencies(thorvald_sprayer_gennodejs thorvald_sprayer_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS thorvald_sprayer_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(thorvald_sprayer
  "/home/thomasdegallaix-ubuntu/catkin_ws/src/thorvald_sprayer/msg/feedbackData.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/thorvald_sprayer
)
_generate_msg_py(thorvald_sprayer
  "/home/thomasdegallaix-ubuntu/catkin_ws/src/thorvald_sprayer/msg/CANFrame.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/thorvald_sprayer
)

### Generating Services
_generate_srv_py(thorvald_sprayer
  "/home/thomasdegallaix-ubuntu/catkin_ws/src/thorvald_sprayer/srv/sprayer_controller.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/thorvald_sprayer
)

### Generating Module File
_generate_module_py(thorvald_sprayer
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/thorvald_sprayer
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(thorvald_sprayer_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(thorvald_sprayer_generate_messages thorvald_sprayer_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/thomasdegallaix-ubuntu/catkin_ws/src/thorvald_sprayer/srv/sprayer_controller.srv" NAME_WE)
add_dependencies(thorvald_sprayer_generate_messages_py _thorvald_sprayer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/thomasdegallaix-ubuntu/catkin_ws/src/thorvald_sprayer/msg/CANFrame.msg" NAME_WE)
add_dependencies(thorvald_sprayer_generate_messages_py _thorvald_sprayer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/thomasdegallaix-ubuntu/catkin_ws/src/thorvald_sprayer/msg/feedbackData.msg" NAME_WE)
add_dependencies(thorvald_sprayer_generate_messages_py _thorvald_sprayer_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(thorvald_sprayer_genpy)
add_dependencies(thorvald_sprayer_genpy thorvald_sprayer_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS thorvald_sprayer_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/thorvald_sprayer)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/thorvald_sprayer
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(thorvald_sprayer_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/thorvald_sprayer)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/thorvald_sprayer
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(thorvald_sprayer_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/thorvald_sprayer)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/thorvald_sprayer
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(thorvald_sprayer_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/thorvald_sprayer)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/thorvald_sprayer
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(thorvald_sprayer_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/thorvald_sprayer)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/thorvald_sprayer\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/thorvald_sprayer
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(thorvald_sprayer_generate_messages_py std_msgs_generate_messages_py)
endif()
