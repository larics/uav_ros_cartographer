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
cd "$MY_PATH"

# Install
bash $MY_PATH/install.sh

# Install workspace
WORKSPACE_NAME=carto_ws
curl https://raw.githubusercontent.com/larics/uav_ros_stack/main/installation/workspace_setup.sh | bash -s $WORKSPACE_NAME

# Build catkin workspace
ROOT_DIR=`dirname $MY_PATH`
cd ~/$WORKSPACE_NAME/src
ln -s $ROOT_DIR
source /opt/ros/$ROS_DISTRO/setup.bash