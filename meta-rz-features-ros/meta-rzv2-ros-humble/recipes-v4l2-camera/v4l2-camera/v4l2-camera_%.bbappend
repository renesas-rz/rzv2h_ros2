FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
SRC_URI:append = " \
    file://0001-fix-opencva-drp-resource-conflict.patch \
    "
#FILES:${PN} += "\
#  /usr/lib/lib*.so* \
#  /usr/lib/v4l2_camera/* \
#"
#SYSROOT_DIRS:append = " \
#  /usr/lib \
#  /usr/lib/v4l2_camera \
#"
