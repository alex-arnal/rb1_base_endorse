cmake_minimum_required(VERSION 2.8.3)
project(command_interface)

find_package(catkin REQUIRED)

catkin_package(
)

include_directories(
)

install(
  DIRECTORY launch config
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
)
