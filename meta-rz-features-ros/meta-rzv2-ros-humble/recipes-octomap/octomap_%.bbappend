# skip delete chrpath --delete
do_install() {
    cmake_do_install
    if [ -d ${D}${datadir}/ament_index/resource_index/parent_prefix_path ]; then
        find ${D}${datadir}/ament_index/resource_index/parent_prefix_path -type f \
            | xargs --no-run-if-empty sed -i -e 's@${STAGING_DIR_HOST}/@/@g' -e 's@${STAGING_DIR_NATIVE}/@/@g'
    else
        true
    fi
    return
}
