# UAV ROS Cartographer

| UAV ROS Cartographer build status | [![Melodic](https://github.com/larics/uav_ros_cartographer/actions/workflows/melodic.yml/badge.svg)](https://github.com/larics/uav_ros_cartographer/actions/workflows/melodic.yml) | [![Noetic](https://github.com/larics/uav_ros_cartographer/actions/workflows/noetic.yml/badge.svg)](https://github.com/larics/uav_ros_cartographer/actions/workflows/noetic.yml)|
|-----------------------|---------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------|

## Introduction

This repository integrates Cartographer SLAM with the [uav_ros_stack](https://github.com/larics/uav_ros_stack) on Ardupilot or PX4 UAV platforms. In a simulation environment this packages is intended to be used with [uav_ros_simulation](https://github.com/larics/uav_ros_simulation). 

This repository installs the following:
| ROS Package                                                                               | Description | 18.04  | 20.04|
|-----------------------|--------------------------------------------------------------------------------|------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------|
| [cartographer](https://github.com/larics/cartographer/tree/larics-master) | Cartographer is a system that provides real-time simultaneous localization and mapping (SLAM) in 2D and 3D across multiple platforms and sensor configurations | [![Melodic](https://github.com/larics/cartographer/actions/workflows/melodic.yml/badge.svg)](https://github.com/larics/cartographer/actions/workflows/melodic.yml) | [![Noetic](https://github.com/larics/cartographer/actions/workflows/noetic.yml/badge.svg)](https://github.com/larics/cartographer/actions/workflows/noetic.yml)|
| [cartographer_ros](https://github.com/larics/cartographer_ros/tree/larics-master) | Provides ROS integration for Cartographer | [![Melodic](https://github.com/larics/cartographer_ros/actions/workflows/melodic.yml/badge.svg)](https://github.com/larics/cartographer_ros/actions/workflows/melodic.yml) | [![Noetic](https://github.com/larics/cartographer_ros/actions/workflows/noetic.yml/badge.svg)](https://github.com/larics/cartographer_ros/actions/workflows/noetic.yml) |

## Installation

### Beginner

Follow these steps for a quick and easy start. This creates a Catkin Workspace called ```carto_ws``` in ```$HOME``` directory. 
It automatically installs all the dependencies and builds the UAV Cartographer system.

```bash
# Clone the repository anywhere you want
git clone https://github.com/larics/uav_ros_cartographer

# Start the installation script
cd uav_ros_cartographer/installation
./install_and_setup_workspace.s

# Build the Catkin workspace
cd ~/carto_ws
catkin build
```

### Advanced

Follow these installation steps if you already have a Catkin workspace already set up.

``` bash
# Navigate to src folder of the catkin workspace
cd /path/to/catkin_ws/src

# Install uav_ros_cartographer
git clone https://github.com/larics/uav_ros_cartographer
cd uav_ros_cartographer/installation
./install.sh

# Build catkin workspace
catkin build
```
