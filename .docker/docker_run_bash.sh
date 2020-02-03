#!/bin/bash

docker run --rm -it \
    -p 1883:1883 \
    --net ros \
    --name tester2 \
    --env ROS_HOSTNAME=tester2 \
    --env ROS_MASTER_URI=http://master:11311 \
    endorse-command-interface:latest \
    bash 

