message(STATUS "Using ${CMAKE_CURRENT_LIST_FILE} for finding SDL2_ttf")

if(NOT FREETYPE_FOUND)
  find_package(Freetype 2 REQUIRED)
endif()

find_library(SDL2_ttf_LIBRARIES
  NAMES SDL2_ttf-2.0 SDL2_ttf-2 SDL2_ttf
  PATHS ${SDL2_LIBDIR} ${SDL2_ttf_DIR} ${SDL2_ttf_LIBRARY_DIR})
if(NOT SDL2_ttf_LIBRARIES)
  message(FATAL_ERROR "Unable to find SDL2_ttf library")
endif()
message(STATUS "Found SDL2_ttf_LIBRARIES: ${SDL2_ttf_LIBRARIES}")

if(TARGET SDL2_ttf::SDL2_ttf)
  message(STATUS "SDL2_ttf::SDL2_ttf: found existing")
else()
  message(STATUS "SDL2_ttf::SDL2_ttf: creating custom")
  add_library(SDL2_ttf::SDL2_ttf STATIC IMPORTED GLOBAL)
  set_target_properties(SDL2_ttf::SDL2_ttf PROPERTIES
    IMPORTED_LINK_INTERFACE_LANGUAGES "C"
    IMPORTED_LOCATION "${SDL2_EXEC_PREFIX}/lib/${CMAKE_STATIC_LIBRARY_PREFIX}SDL2_ttf${CMAKE_STATIC_LIBRARY_SUFFIX}"
  )
  target_link_libraries(SDL2_ttf::SDL2_ttf INTERFACE
    ${SDL2_ttf_LIBRARIES}
    SDL2::SDL2
    Freetype::Freetype
  )
endif()

set(SDL2_ttf_FOUND TRUE CACHE BOOL "Whether SDL2_ttf has been found")
