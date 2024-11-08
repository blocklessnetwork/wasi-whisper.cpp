IMAGE_NAME=bls-whisper.wasi
include ./inc.mk

all: build

build:
	script/prepared.sh
	docker build -t ghcr.io/blocklessnetwork/${IMAGE_NAME} --progress plain -f Dockerfile . 

download:
	./models/download-ggml-model.sh base.en

push:
	docker push ghcr.io/blocklessnetwork/${IMAGE_NAME}
	docker tag ghcr.io/blocklessnetwork/${IMAGE_NAME} ghcr.io/blocklessnetwork/${IMAGE_NAME}:${IMAGE_TAG_VERSION}
	docker push ghcr.io/blocklessnetwork/${IMAGE_NAME}:${IMAGE_TAG_VERSION}

extract_wasi:
	docker run --name tmp.container.${IMAGE_NAME} ghcr.io/blocklessnetwork/${IMAGE_NAME}:${IMAGE_TAG_VERSION} ls || echo 1
	docker ps -a
	docker cp tmp.container.${IMAGE_NAME}:/whisper.wasm .
	docker cp tmp.container.${IMAGE_NAME}:/libwhisper.a .