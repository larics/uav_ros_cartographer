#!/bin/bash

# Exit immediatelly if a command exits with a non-zero status
set -e

# Executes a command when DEBUG signal is emitted in this script - should be after every line
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG

# Executes a command when ERR signal is emmitted in this script
trap 'echo "$0: \"${last_command}\" command failed with exit code $?"' ERR

distro=`lsb_release -r | awk '{ print $2 }'`
[ "$distro" = "18.04" ] && ROS_DISTRO="melodic"
[ "$distro" = "20.04" ] && ROS_DISTRO="noetic"

# get the path to this script
MY_PATH=`dirname "$0"`
MY_PATH=`( cd "$MY_PATH" && pwd )`
cd "$MY_PATH/.."

# Install ROS
wget https://raw.githubusercontent.com/larics/uav_ros_stack/main/installation/dependencies/ros.sh
chmod +x install.sh
bash install.sh
rm -f install.sh

# Install General ROS things
wget https://raw.githubusercontent.com/larics/uav_ros_stack/main/installation/dependencies/general.sh
chmod +x general.sh
bash general.sh
rm -f general.sh

# Install Cartographer specific dependencies
sudo apt-get update
sudo apt-get install -y \
    clang \
    cmake \
    g++ \
    git \
    google-mock \
    libboost-all-dev \
    libcairo2-dev \
    libcurl4-openssl-dev \
    libeigen3-dev \
    libgflags-dev \
    libgoogle-glog-dev \
    liblua5.2-dev \
    libsuitesparse-dev \
    lsb-release \
    ninja-build \
    stow \
    libgmock-dev \
    libceres-dev \
    protobuf-compiler \
    libpcl-dev

if [ "$distro" = "18.04" ]; then
    sudo apt-get install -y python-sphinx 
elif [ "$distro" = "20.04" ]; then
    sudo apt-get install -y python3-sphinx 
fi

# Install Gitman
wget https://raw.githubusercontent.com/larics/uav_ros_stack/main/installation/dependencies/gitman.sh
chmod +x gitman.sh
bash gitman.sh
rm -f gitman.sh

# Install Gitman pckages
gitman install --force