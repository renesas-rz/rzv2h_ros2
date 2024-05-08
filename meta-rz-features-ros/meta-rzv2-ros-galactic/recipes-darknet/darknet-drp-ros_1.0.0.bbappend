# Copy library
SRC_URI += " \
    file://libtvm_runtime.so \
    "

do_compile:prepend() {
    cp ${WORKDIR}/libtvm_runtime.so ${RECIPE_SYSROOT}/usr/lib64/
}

do_install:append() {
    install -d ${D}/${libdir}
    install -m 0755 ${WORKDIR}/libtvm_runtime.so ${D}/${libdir}
}

# Apply patches
FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"
SRC_URI += " \
    file://0001-drp-update.patch \
    "
