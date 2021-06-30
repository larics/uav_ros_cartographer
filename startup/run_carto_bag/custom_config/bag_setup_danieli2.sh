#!/bin/bash

export BAG_NAME=$HOME/Bags/carto_bags/carto_indoor_ouster.bag
export CONFIGURATION_BASENAME=ouster_pozyx_old.lua
export CONFIGURATION_DIRECTORY=$(pwd)/custom_config
export CARTO_URDF=$(rospack find uav_ros_general)/urdf/ouster-imu.urdf.xacro

# Define bag topics
export BAG_POINT_TOPIC=/os_cloud_node/points
export BAG_IMU_TOPIC=/danieli2/mavros/imu/data
export BAG_TRANSFORM_TOPIC=/pozyx/measured

# Define cartographer topics
export POINT_TOPIC=/$UAV_NAMESPACE/os_cloud_node/points
export IMU_TOPIC=/$UAV_NAMESPACE//mavros/imu/data
export TRANSFORM_TOPIC=/$UAV_NAMESPACE/pozyx/measured