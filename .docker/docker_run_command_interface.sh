#!/bin/bash

docker run --rm -it \
    --net ros \
    --name command_interface \
    --env ROS_HOSTNAME=command_interface \
    --env ROS_MASTER_URI=http://master:11311 \
    endorse-command-interface:latest \
    bash -c 'service mosquitto start; . /root/catkin_ws/devel/setup.bash; roslaunch command_interface command_interface_complete.launch'
