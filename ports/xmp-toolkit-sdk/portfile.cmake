vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO siposcsaba89/XMP-Toolkit-SDK
    REF 4d7d2c5ca67e828288d18774de4b901eb5e4a5d8
    SHA512 8c654561e6b846555c518e8011cd4d879f00df620e678af6ee8a6c45d880ef31f2303fa7b5146a722b570883884530edb35d106ad42d064510721f1dbad8b5ae
    PATCHES
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
    OPTIONS
)

vcpkg_install_cmake()

vcpkg_fixup_cmake_targets()

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)

file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/xmp-toolkit-sdk RENAME copyright)

#file(COPY ${CMAKE_CURRENT_LIST_DIR}/usage DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})


vcpkg_copy_pdbs()
