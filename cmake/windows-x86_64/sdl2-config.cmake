set(prefix "/usr/local/x86_64-w64-mingw32") 
set(exec_prefix "${prefix}")
set(libdir "${exec_prefix}/lib")
set(SDL2_PREFIX "/usr/local/x86_64-w64-mingw32")
set(SDL2_EXEC_PREFIX "/usr/local/x86_64-w64-mingw32")
set(SDL2_LIBDIR "${exec_prefix}/lib")
list(APPEND SDL2_INCLUDE_DIRS "${prefix}/include/SDL2;${prefix}/include")
set(SDL2_LIBRARIES "-L${SDL2_LIBDIR}  -lmingw32 -lSDL2main -lSDL2 -mwindows")
string(STRIP "${SDL2_LIBRARIES}" SDL2_LIBRARIES)

if(TARGET SDL2::SDL2)
  message(STATUS "SDL2::SDL2: found existing")
else()
  message(STATUS "SDL2::SDL2: creating custom")
  # Remove -lSDL2 as that is handled by CMake, note the space at the end so it does not replace e.g. -lSDL2main
  # This may require "libdir" beeing set (from above)
  string(REPLACE "-lSDL2 " "" SDL2_EXTRA_LINK_FLAGS " -lmingw32 -lSDL2main -lSDL2 -mwindows ")
  string(STRIP "${SDL2_EXTRA_LINK_FLAGS}" SDL2_EXTRA_LINK_FLAGS)
  string(REPLACE "-lSDL2 " "" SDL2_EXTRA_LINK_FLAGS_STATIC " -Wl,--no-undefined -Wl,--dynamicbase -Wl,--nxcompat -Wl,--high-entropy-va -lm -ldinput8 -ldxguid -ldxerr8 -luser32 -lgdi32 -lwinmm -limm32 -lole32 -loleaut32 -lshell32 -lsetupapi -lversion -luuid -static-libgcc ")
  string(STRIP "${SDL2_EXTRA_LINK_FLAGS_STATIC}" SDL2_EXTRA_LINK_FLAGS_STATIC)

  add_library(SDL2::SDL2 SHARED IMPORTED GLOBAL)
  set_target_properties(SDL2::SDL2 PROPERTIES
    INTERFACE_INCLUDE_DIRECTORIES "${SDL2_INCLUDE_DIRS}"
    IMPORTED_LINK_INTERFACE_LANGUAGES "C"
    IMPORTED_LOCATION "${SDL2_LIBDIR}/${CMAKE_SHARED_LIBRARY_PREFIX}SDL2${CMAKE_SHARED_LIBRARY_SUFFIX}"
    IMPORTED_IMPLIB   "${SDL2_LIBDIR}/${CMAKE_SHARED_LIBRARY_PREFIX}SDL2${CMAKE_STATIC_LIBRARY_SUFFIX}"
    INTERFACE_LINK_LIBRARIES "${SDL2_EXTRA_LINK_FLAGS_STATIC}")

  add_library(SDL2::SDL2-static STATIC IMPORTED GLOBAL)
  set_target_properties(SDL2::SDL2-static PROPERTIES
    INTERFACE_INCLUDE_DIRECTORIES "${SDL2_INCLUDE_DIRS}"
    IMPORTED_LINK_INTERFACE_LANGUAGES "C"
    IMPORTED_LOCATION "${SDL2_LIBDIR}/${CMAKE_STATIC_LIBRARY_PREFIX}SDL2${CMAKE_STATIC_LIBRARY_SUFFIX}"
    INTERFACE_LINK_LIBRARIES "${SDL2_EXTRA_LINK_FLAGS_STATIC}")

  add_library(SDL2::SDL2main STATIC IMPORTED GLOBAL)
  set_target_properties(SDL2::SDL2main PROPERTIES
    INTERFACE_INCLUDE_DIRECTORIES "${SDL2_INCLUDE_DIRS}"
    IMPORTED_LINK_INTERFACE_LANGUAGES "C"
    IMPORTED_LOCATION "${SDL2_LIBDIR}/${CMAKE_STATIC_LIBRARY_PREFIX}SDL2main${CMAKE_STATIC_LIBRARY_SUFFIX}")
endif()

set(SDL2_FOUND TRUE CACHE BOOL "Whether SDL2 has been found")
