#! /bin/env bash

WASI_VERSION=24
WASI_VERSION_FULL=${WASI_VERSION}.0
if [[ ! -d wasi-sdk ]]; then
    if [[ ! -f wasi-sdk-${WASI_VERSION_FULL}-x86_64-linux.tar.gz ]]; then 
        wget https://github.com/WebAssembly/wasi-sdk/releases/download/wasi-sdk-${WASI_VERSION}/wasi-sdk-${WASI_VERSION_FULL}-x86_64-linux.tar.gz
        
    fi
    tar xvf wasi-sdk-${WASI_VERSION_FULL}-x86_64-linux.tar.gz
    rm wasi-sdk-${WASI_VERSION_FULL}-x86_64-linux.tar.gz
    mv wasi-sdk-${WASI_VERSION_FULL}-x86_64-linux wasi-sdk
fi

BINARYEN_VERSION=119
if [[ ! -d binaryen ]]; then
    if [[ ! -f binaryen-version_${BINARYEN_VERSION}-x86_64-linux.tar.gz ]]; then 
        wget https://github.com/WebAssembly/binaryen/releases/download/version_${BINARYEN_VERSION}/binaryen-version_${BINARYEN_VERSION}-x86_64-linux.tar.gz
    fi
    tar xvf binaryen-version_${BINARYEN_VERSION}-x86_64-linux.tar.gz
    rm binaryen-version_${BINARYEN_VERSION}-x86_64-linux.tar.gz
    mv binaryen-version_${BINARYEN_VERSION} binaryen
fi
