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

## Run with bls-runtime

```bash
$ bls-runtime --fs-root-path=`pwd` whisper.wasm --  -m models/ggml-base.en.bin -f samples/jfk.wav --print-colors
```
