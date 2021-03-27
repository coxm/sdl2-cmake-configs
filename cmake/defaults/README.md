# Cross-platform generic CMake directory
Place find modules and package configs that can be used on all/most systems
here. The `CMAKE_FIND_ROOT_PATH` for a target system should be set as follows
in the relevant toolchain file.
```cmake
# ci/$target_name/toolchain.cmake
list(APPEND CMAKE_FIND_ROOT_PATH
    ${CMAKE_SOURCE_DIR}/cmake/${TARGET_NAME}
    ${CMAKE_SOURCE_DIR}/cmake/generic
    /usr/${TOOLCHAIN_PREFIX}
    /usr/local/${TOOLCHAIN_PREFIX}
)
```

For example, in `windows-x86_64/toolchain.cmake` we might have something like
```cmake
list(APPEND CMAKE_FIND_ROOT_PATH
  ${CMAKE_SOURCE_DIR}/cmake/windows-x86_64
  ${CMAKE_SOURCE_DIR}/cmake/generic
  "/usr/${TOOLCHAIN_PREFIX}"
  "/usr/local/${TOOLCHAIN_PREFIX}"
)
```
