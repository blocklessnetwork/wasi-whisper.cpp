set(TARGET main)
add_executable(${TARGET} main.cpp)
set(CMAKE_CXX_LINK_FLAGS "-fno-exceptions -pthread --target=wasm32-wasi-threads -Wl,--max-memory=671088640,--import-memory,--export-memory")

include(DefaultTargetOptions)

target_link_libraries(${TARGET} PRIVATE common whisper)


