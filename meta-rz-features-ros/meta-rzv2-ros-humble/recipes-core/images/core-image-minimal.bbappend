
INSANE_SKIP_${PN} += "buildpaths"
INSANE_SKIP_${PN}-ptest += "buildpaths"

ROOTFS_POSTPROCESS_COMMAND += "remove_tmpdir_references;"

remove_tmpdir_references() {
    find ${IMAGE_ROOTFS}/opt/ros/humble/share/ -type f -exec sed -i 's|${TMPDIR}||g' {} +
}
