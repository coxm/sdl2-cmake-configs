message(STATUS "Using ${CMAKE_CURRENT_LIST_FILE} for finding SDL2_image")

find_library(SDL2_image_LIBRARIES
  NAMES SDL2_image-2.0 SDL2_image-2 SDL2_image
  PATHS ${SDL2_LIBDIR} ${SDL2_image_DIR} ${SDL2_image_LIBRARY_DIR})
if(NOT SDL2_image_LIBRARIES)
  message(FATAL_ERROR "Unable to find SDL2_image library")
endif()
message(STATUS "Found SDL2_image_LIBRARIES ${SDL2_image_LIBRARIES}")

if(TARGET SDL2_image::SDL2_image)
  message(STATUS "SDL2_image::SDL2_image: found existing")
else()
  message(STATUS "SDL2_image::SDL2_image: creating custom")
  add_library(SDL2_image::SDL2_image STATIC IMPORTED GLOBAL)
  set_target_properties(SDL2_image::SDL2_image PROPERTIES
    IMPORTED_LINK_INTERFACE_LANGUAGES "C"
    IMPORTED_LOCATION "${SDL2_EXEC_PREFIX}/lib/${CMAKE_STATIC_LIBRARY_PREFIX}SDL2_image${CMAKE_STATIC_LIBRARY_SUFFIX}"
  )
  target_link_libraries(SDL2_image::SDL2_image INTERFACE
    ${SDL2_image_LIBRARIES}
    SDL2::SDL2
  )
endif()

set(SDL2_image_FOUND TRUE CACHE BOOL "Whether SDL2_image has been found")
