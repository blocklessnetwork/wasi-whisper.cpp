IMAGE_NAME=bls-whisper.wasi

all: build

build:
	script/prepared.sh
	docker build -t ${IMAGE_NAME} --progress plain -f Dockerfile . 

download:
	./models/download-ggml-model.sh base.en
