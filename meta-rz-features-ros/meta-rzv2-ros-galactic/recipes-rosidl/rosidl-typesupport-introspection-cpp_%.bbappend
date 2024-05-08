FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

FILES:${PN} += "\
  /usr/lib/lib*.so \
  /usr/lib/rosidl_typesupport_introspection_cpp \
  /usr/lib/rosidl_typesupport_introspection_cpp/rosidl_typesupport_introspection_cpp \
"
SYSROOT_DIRS:append = " \
  /usr/lib \
  /usr/lib/rosidl_typesupport_introspection_cpp \
  /usr/lib/rosidl_typesupport_introspection_cpp/rosidl_typesupport_introspection_cpp \
"

