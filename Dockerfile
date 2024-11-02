FROM ubuntu:22.04 AS maker
ENV WASI_SDK=/work/wasi-sdk
COPY . /work
RUN apt-get update -qq && apt-get -y install \
    autoconf \
    automake \
    cmake \
    pkg-config 

WORKDIR /work
RUN mkdir ./build /out -p && \
    cd build && \
    cmake ../ -DLLAMA_ACCELERATE=OFF -DGGML_NO_ACCELERATE=ON -DWHISPER_BUILD_EXAMPLES=ON -DCMAKE_TOOLCHAIN_FILE=${WASI_SDK}/share/cmake/wasi-sdk-pthread.cmake &&\
    make && \
    mv bin/main /out/whisper.wasm &&\\
    mv libwhisper.a /out/libwhisper.a 
RUN /work/binaryen/bin/wasm-opt -O3 -o /out/whisper.wasm /out/whisper.wasm

FROM scratch as whisper
COPY --link --from=maker /out/whisper.wasm /whisper.wasm
COPY --link --from=maker /out/libwhisper.a /libwhisper.a



