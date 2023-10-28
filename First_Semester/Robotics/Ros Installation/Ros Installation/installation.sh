#!/bin/bash

echo "Installing ROS Noetic"
echo "Running Commands one after another"

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros1-latest.list'

sudo apt install curl # if you haven't already installed curl
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -


sudo apt update

sudo apt install ros-noetic-desktop-full

echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
source ~/.bashrc

sudo apt install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential

sudo apt install python3-rosdep

sudo rosdep init
rosdep update

sudo apt install python3-roslaunch

sudo apt install python3-catkin-tools python3-rosdep 
sudo apt install ros-noetic-joy ros-noetic-teleop-twist-joy 
sudo apt install ros-noetic-teleop-twist-keyboard ros-noetic-laser-proc 
sudo apt install ros-noetic-rgbd-launch ros-noetic-rosserial-arduino 
sudo apt install ros-noetic-rosserial-python ros-noetic-rosserial-client 
sudo apt install ros-noetic-rosserial-msgs ros-noetic-amcl ros-noetic-map-server 
sudo apt install ros-noetic-move-base ros-noetic-urdf ros-noetic-xacro 
sudo apt install ros-noetic-compressed-image-transport ros-noetic-rqt* ros-noetic-rviz 
sudo apt install ros-noetic-gmapping ros-noetic-navigation ros-noetic-interactive-markers

sudo rosdep init

echo "All commands have been executed successfully"

echo "trying ros by running roscore"

roscore