# Copy library
DEPENDS += " drp-ai-tvm"
RDEPENDS:${PN} += " drp-ai-tvm"

do_configure:prepend() {
    export TVM_HOME="${STAGING_DIR_HOST}/usr/include/tvm"
}

# Apply patches
FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"
SRC_URI = "gitsm://github.com/leggedrobotics/darknet_ros;${ROS_BRANCH};protocol=https \
           file://0001-drp-update.patch \
           "
