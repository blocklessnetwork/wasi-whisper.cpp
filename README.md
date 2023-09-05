# wasi-whisper.cpp

## How to build

```bash
$ export WASI_SDK=`pwd`/wasi-sdk
$ make
```

## Download models

```bash
$ make download
```

## Translate to 16 bit wav 

```bash
$ ffmpeg -loglevel -0 -y -i samples.ogg -ar 16000 -ac 1 -c:a pcm_s16le samples.wav
```

## Run with bls-runtime

```bash
$ bls-runtime --fs-root-path=`pwd` whisper.wasm --  -m models/ggml-base.en.bin -f samples/jfk.wav --print-colors
```
