#!/bin/bash

# patch for build/conf
patch -p1 < meta-ros-humble.patch

# use bitbake-layers command
source poky/oe-init-build-env

# for meta-ros humble
bitbake-layers add-layer ../meta-ros/meta-ros-common
bitbake-layers add-layer ../meta-ros/meta-ros2
bitbake-layers add-layer ../meta-ros/meta-ros2-humble
bitbake-layers add-layer ../meta-rzv2-ros-humble

