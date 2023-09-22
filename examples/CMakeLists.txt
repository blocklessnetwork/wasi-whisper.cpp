# dependencies


if (WHISPER_SDL2)
    # SDL2
    find_package(SDL2 REQUIRED)

    string(STRIP "${SDL2_LIBRARIES}" SDL2_LIBRARIES)

    message(STATUS "SDL2_INCLUDE_DIRS = ${SDL2_INCLUDE_DIRS}")
    message(STATUS "SDL2_LIBRARIES = ${SDL2_LIBRARIES}")
endif()

# common

set(TARGET common)

add_library(${TARGET} STATIC
    common.h
    common.cpp
    common-ggml.h
    common-ggml.cpp
    )

set(CMAKE_CXX_LINK_FLAGS "-fno-exceptions -pthread")

include(DefaultTargetOptions)

target_link_libraries(${TARGET} PRIVATE whisper)

set_target_properties(${TARGET} PROPERTIES POSITION_INDEPENDENT_CODE ON)

if (WHISPER_SDL2)
    # common-sdl

    set(TARGET common-sdl)

    add_library(${TARGET} STATIC
        common-sdl.h
        common-sdl.cpp
        )


    target_include_directories(${TARGET} PUBLIC ${SDL2_INCLUDE_DIRS})
    target_link_libraries(${TARGET} PRIVATE ${SDL2_LIBRARIES})

    set_target_properties(${TARGET} PROPERTIES POSITION_INDEPENDENT_CODE ON)
endif()

# examples

include_directories(${CMAKE_CURRENT_SOURCE_DIR})

add_subdirectory(main)