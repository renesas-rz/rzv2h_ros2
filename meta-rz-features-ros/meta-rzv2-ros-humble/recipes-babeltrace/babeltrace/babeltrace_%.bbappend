do_configure:prepend() {
    export PYTHON_CONFIG=${STAGING_BINDIR_NATIVE}/python3.12-config
}

DEPENDS += "python3-setuptools-native"
