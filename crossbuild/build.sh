unset AMENT_PREFIX_PATH
unset CMAKE_PREFIX_PATH
unset COLCON_PREFIX_PATH
unset PYTHONPATH
export AMENT_PREFIX_PATH="/opt/rz-vlp/5.0.11/sysroots/cortexa55-poky-linux/opt/ros/humble:/opt/rz-vlp/5.0.11/sysroots/cortexa55-poky-linux/usr:/opt/rz-vlp/5.0.11/sysroots/cortexa55-poky-linux/usr/lib:/opt/rz-vlp/5.0.11/sysroots/cortexa55-poky-linux/usr/lib/cmake"

export PYTHONPATH="/opt/rz-vlp/5.0.11/sysroots/x86_64-pokysdk-linux/usr/lib/python3.12/site-packages:/opt/rz-vlp/5.0.11/sysroots/cortexa55-poky-linux/usr/lib/python3.12/site-packages:/opt/rz-vlp/5.0.11/sysroots/cortexa55-poky-linux/opt/ros/humble/lib/python3.12/site-packages"

export CMAKE_PREFIX_PATH="/opt/rz-vlp/5.0.11/sysroots/cortexa55-poky-linux/opt/ros/humble/lib/cmake:/opt/rz-vlp/5.0.11/sysroots/x86_64-pokysdk-linux/usr:/opt/rz-vlp/5.0.11/sysroots/x86_64-pokysdk-linux/usr/lib:/opt/rz-vlp/5.0.11/sysroots/x86_64-pokysdk-linux/usr/lib/cmake:/opt/rz-vlp/5.0.11/sysroots/cortexa55-poky-linux/usr/lib/cmake:/opt/rz-vlp/5.0.11/sysroots/cortexa55-poky-linux/usr/lib:/opt/rz-vlp/5.0.11/sysroots/cortexa55-poky-linux/usr:/opt/rz-vlp/5.0.11/sysroots/cortexa55-poky-linux/usr/share"

export TVM_HOME="/opt/rz-vlp/5.0.11/sysroots/cortexa55-poky-linux/usr/include/tvm"
export ROS_DISTRO=humble


PKGARGS=""
if [ $# == 1 ] ; then
  PKGARGS="--packages-select $1"
  echo $PKGARGS
else
  pkg_list=$(colcon list --names-only)
  if echo "$pkg_list" | grep -q "^pendulum_control$"; then # For demo_nodes_cpp
    echo "Detected 'pendulum_control'. It will be skipped due to missing librttest for cross-build."
    PKGARGS="--packages-skip pendulum_control"
  fi
 fi


colcon build --merge-install \
    --cmake-force-configure \
    --cmake-args \
        -DCMAKE_TOOLCHAIN_FILE=${PWD}/cross.cmake \
        -DCMAKE_MAKE_PROGRAM=/usr/bin/make \
        -DBUILD_TESTING=OFF \
        -DPython3_EXECUTABLE=/opt/rz-vlp/5.0.11/sysroots/x86_64-pokysdk-linux/usr/bin/python3 \
        -DPython3_ROOT_DIR=/opt/rz-vlp/5.0.11/sysroots/x86_64-pokysdk-linux/usr \
        -DPython3_FIND_STRATEGY=LOCATION \
        -DPython3_NumPy_INCLUDE_DIR=/opt/rz-vlp/5.0.11/sysroots/x86_64-pokysdk-linux/usr/lib/python3.12/site-packages/numpy/core/include \
    $PKGARGS

