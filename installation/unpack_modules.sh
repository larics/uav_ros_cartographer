#!/bin/bash

# This script is used to unpack uav_ros_cartographer packages in a development-friendly way
# The end result of this script should be as follows:
# catkin_ws
# - src
# --- uav_ros_cartographer (with dirty git + CATKIN_IGNORE)
# --- uav_ros_cartographer_modules
# ------ cartographer
# ------ cartographer_ros


# Executes a command when DEBUG signal is emitted in this script - should be after every line
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG

# Executes a command when ERR signal is emmitted in this script
trap 'echo "$0: \"${last_command}\" command failed with exit code $?"' ERR

# get the path to this script
MY_PATH=`dirname "$0"`
MY_PATH=`( cd "$MY_PATH" && pwd )`

if [ "$#" -ne 1 ]; then
    echo "One argument expected - path to the 'src' folder of the Catkin Workspace"
    exit 2
fi

CATKIN_SRC=$1

# Check if this is a directory
if [[ ! -d "$CATKIN_SRC" ]]; then
    echo "$CATKIN_SRC is not a directory"
    exit 2
fi

cd $MY_PATH/..

echo "Uninstalling gitman modules in $(pwd)"
gitman uninstall -f

echo "Stashing git changes in $(pwd)"
git stash

echo "Updating gitman.yml with new location"
sed -i '1s@.*@location: ../uav_ros_cartographer_modules@' gitman.yml
gitman update -f
touch "CATKIN_IGNORE"

CARTO_PATH=$(readlink -f "$MY_PATH/../../uav_ros_cartographer")
CARTO_MODULES_PATH=$(readlink -f "$MY_PATH/../../uav_ros_cartographer_modules")

# Link all the modules
ln -s $CARTO_PATH $CATKIN_SRC
ln -s $CARTO_MODULES_PATH $CATKIN_SRC

# Link the development tools
ln -s $SIM_PATH/ros_packages/cartographer/cartographer/.clang-format $CATKIN_SRC/.clang-format

cd $MY_PATH