set(TARGET main)
add_executable(${TARGET} main.cpp)
set(CMAKE_CXX_LINK_FLAGS "-fno-exceptions")

include(DefaultTargetOptions)

target_link_libraries(${TARGET} PRIVATE common whisper)


