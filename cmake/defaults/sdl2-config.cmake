set(SDL2_PREFIX "/usr")
set(SDL2_INCLUDE_DIRS "${SDL2_PREFIX}/include/SDL2;${SDL2_PREFIX}/include")
set(SDL2_LIBRARIES "-lSDL2")

if(TARGET SDL2::SDL2)
  message(STATUS "SDL2::SDL2: found existing")
else()
  message(STATUS "SDL2::SDL2: creating custom")
  add_library(SDL2::SDL2 INTERFACE IMPORTED GLOBAL)
  target_link_libraries(SDL2::SDL2 INTERFACE ${SDL2_LIBRARIES})
  target_include_directories(SDL2::SDL2 INTERFACE ${SDL2_INCLUDE_DIRS})
endif()

set(SDL2_FOUND TRUE CACHE BOOL "Whether SDL2 has been found")
