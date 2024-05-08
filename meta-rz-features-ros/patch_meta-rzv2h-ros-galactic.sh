#!/bin/bash

# patch for build/conf
patch -p1 < meta-ros-galactic.patch

# use bitbake-layers command
source poky/oe-init-build-env

# for Docker
bitbake-layers add-layer ../meta-openembedded/meta-filesystems
bitbake-layers add-layer ../meta-openembedded/meta-networking
bitbake-layers add-layer ../meta-virtualization

# for meta-ros galactic
bitbake-layers add-layer ../meta-ros/meta-ros-backports-gatesgarth ../meta-ros/meta-ros-backports-hardknott ../meta-ros/meta-ros-common
bitbake-layers add-layer ../meta-ros/meta-ros2
bitbake-layers add-layer ../meta-ros/meta-ros2-galactic
bitbake-layers add-layer ../meta-rzv2-ros-galactic
