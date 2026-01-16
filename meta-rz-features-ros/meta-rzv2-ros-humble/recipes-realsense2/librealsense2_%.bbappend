FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
    file://0001-remove-get-nlohmann-json.patch \
    "

SRC_URI:remove = "file://fixed-compile-error-uint64t.patch"


EXTRA_OECMAKE:append = " \
  -DFORCE_RSUSB_BACKEND=true \
"

inherit ros_insane_dev_so

DEPENDS += "nlohmann-json"

DEPENDS:remove = "glfw"
DEPENDS:remove = "libx11"
RDEPENDS:${PN}:remove = "glfw"
RDEPENDS:${PN}:remove = "libx11"

DEPENDS:remove = "mesa"
DEPENDS:append = " mali-library"
RDEPENDS:${PN}:remove = "mesa"
RDEPENDS:${PN}:append = "mali-library"
CFLAGS += "-I/usr/include/KHR-mali/"
