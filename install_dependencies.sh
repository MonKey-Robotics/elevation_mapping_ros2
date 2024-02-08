#! /bin/bash

# Get script source directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Install grid_map
sudo apt update
sudo apt install ros-$ROS_DISTRO-grid-map

# Clone and install kindr
mkdir ~/repos ; cd ~/repos
git clone git@github.com:ANYbotics/kindr.git
cd kindr
mkdir build ; cd build
cmake .. -DUSE_CMAKE=true
sudo make install

# Clone and install kindr_ros
cd $SCRIPT_DIR/..
git clone -b ros2 git@github.com:SivertHavso/kindr_ros.git
cd ..
colcon build --symlink-install --packages-select kindr_ros
