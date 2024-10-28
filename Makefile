IMAGE_NAME=bls-whisper.wasi

all: build

build:
	script/prepared.sh
	docker build -t ghcr.io/blocklessnetwork/${IMAGE_NAME} --progress plain -f Dockerfile . 

download:
	./models/download-ggml-model.sh base.en

push:
	docker build ghcr.io/blocklessnetwork/${IMAGE_NAME}

extract_wasi:
	docker run --name tmp.container.${IMAGE_NAME} ghcr.io/blocklessnetwork/${IMAGE_NAME} ls &>1 > /dev/null
	docker cp tmp.container.${IMAGE_NAME}:/whisper.wasm .