
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO siposcsaba89/dng_sdk
    REF 85f2329bd0d7e1301a7b5b26af4da443fef8c05d
    SHA512 771fa868d329f514563ef247a7de5d7739b9269fff019114169b141f53e4067cd2e8fbc5792b2d9fefb01d186609cb6fd3ba5c9a293d00959762d1525582da20
    PATCHES
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
    OPTIONS
        -DBUILD_EXAMPLES=1
)

vcpkg_install_cmake()

vcpkg_fixup_cmake_targets(CONFIG_PATH share/dng_sdk TARGET_PATH share/dng_sdk)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
file(INSTALL ${SOURCE_PATH}/LICENSE.txt DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)

#file(MAKE_DIRECTORY ${CURRENT_PACKAGES_DIR}/tools/dng_sdk)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/bin/)
file(RENAME ${CURRENT_PACKAGES_DIR}/bin ${CURRENT_PACKAGES_DIR}/tools)

vcpkg_copy_pdbs()
