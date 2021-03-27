message(STATUS "Using ${CMAKE_CURRENT_LIST_FILE} for finding SDL2_mixer")

find_library(SDL2_mixer_LIBRARIES
  NAMES SDL2_mixer-2.0 SDL2_mixer-2 SDL2_mixer
  PATHS ${SDL2_LIBDIR} ${SDL2_mixer_DIR} ${SDL2_mixer_LIBRARY_DIR})
if(NOT SDL2_mixer_LIBRARIES)
  message(FATAL_ERROR "Unable to find SDL2_mixer library")
endif()
message(STATUS "Found SDL2_mixer_LIBRARIES: ${SDL2_mixer_LIBRARIES}")

if(TARGET SDL2_mixer::SDL2_mixer)
  message(STATUS "SDL2_mixer::SDL2_mixer: found existing")
else()
  message(STATUS "SDL2_mixer::SDL2_mixer: creating custom")
  add_library(SDL2_mixer::SDL2_mixer STATIC IMPORTED GLOBAL)
  set_target_properties(SDL2_mixer::SDL2_mixer PROPERTIES
    IMPORTED_LINK_INTERFACE_LANGUAGES "C"
    IMPORTED_LOCATION "${SDL2_EXEC_PREFIX}/lib/${CMAKE_STATIC_LIBRARY_PREFIX}SDL2_mixer${CMAKE_STATIC_LIBRARY_SUFFIX}"
  )
  target_link_libraries(SDL2_mixer::SDL2_mixer INTERFACE
    ${SDL2_mixer_LIBRARIES}
    SDL2::SDL2
  )
endif()

set(SDL2_mixer_FOUND TRUE CACHE BOOL "Whether SDL2_mixer has been found")
