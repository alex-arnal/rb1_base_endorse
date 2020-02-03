FROM osrf/ros:melodic-desktop-full

ARG GITHUB_USERNAME
ARG GITHUB_PASSWORD

ENV user=$GITHUB_USERNAME
ENV password=$GITHUB_PASSWORD

WORKDIR /root/catkin_ws

SHELL ["/bin/bash", "-c"]

RUN echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc

RUN apt-get update && apt-get install -y \
    apt-utils \
    python-rosinstall \
    python-rosinstall-generator \
    python-wstool \
    build-essential \
    python-catkin-tools \
    wget \
    ssh \
    git \
    python-pip \
    mosquitto \
    mosquitto-clients

RUN mkdir /root/catkin_ws/src

RUN /bin/bash -c '. /opt/ros/melodic/setup.bash; cd /root/catkin_ws; catkin build'

RUN echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc 

WORKDIR /root/catkin_ws/src

RUN git config --global credential.helper 'cache --timeout=100'
RUN git clone -b docker https://${user}:${password}@github.com/RobotnikAutomation/rb1_base_endorse --recurse-submodules

RUN pip install bson inject==3.5.4 paho-mqtt msgpack-python pymongo

WORKDIR /root/catkin_ws

RUN rosdep install --from-paths src --ignore-src -r -y

RUN apt-get clean

RUN /bin/bash -c '. /opt/ros/melodic/setup.bash; . /root/catkin_ws/devel/setup.bash; cd /root/catkin_ws; catkin build'

