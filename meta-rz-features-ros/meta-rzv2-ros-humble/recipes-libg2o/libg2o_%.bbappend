FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
SRC_URI += " \
    file://0001-disable-opengl.patch \
    "

DEPENDS:remove = "libglu mesa"
RDEPENDS:${PN}:remove = "libglu mesa"

EXTRA_OECMAKE += " -DG2O_USE_OPENGL=OFF"

