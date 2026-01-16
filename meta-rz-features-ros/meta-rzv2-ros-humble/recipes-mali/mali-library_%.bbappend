FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

PACKAGES += "${PN}-dev"
FILES_${PN}-dev += "/usr/include/KHR /usr/include/KHR-mali /usr/include/KHR-mali/khrplatform.h"
