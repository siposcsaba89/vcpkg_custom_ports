
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO siposcsaba89/dng_sdk
    REF 53ab0d6d6dfbffb5f78fe1cae630bfc60e935fe8
    SHA512 379e6dc0443f4992678019f562e60eec41e9b6f1f61571cf248898bfcf274147bd9cc4ffde3213fb8f78dd2bc603a85f24fab5e1525d53081f44153121ee2763
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
