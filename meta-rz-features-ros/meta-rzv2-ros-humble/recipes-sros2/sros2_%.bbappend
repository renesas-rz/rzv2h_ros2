FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

do_install:append() {
    if [ -d "${D}/opt/ros/humble/share/share" ]; then
        cp -rT "${D}/opt/ros/humble/share/share" "${D}/opt/ros/humble/share/"
        rm -rf "${D}/opt/ros/humble/share/share"
    fi
}

