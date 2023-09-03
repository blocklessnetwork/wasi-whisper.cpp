all:
ifeq (${WASI_SDK}, )
	$(error Bad WASI_SDK path is not set)
endif
	mkdir build -p
	( \
		cd build && \
		cmake ../ -DLLAMA_ACCELERATE=OFF -DGGML_NO_ACCELERATE=ON -DWHISPER_BUILD_EXAMPLES=ON &&\
		make \
	)
	mv build/bin/main whisper.wasm

clean:
	rm build -rf
	rm whisper.wasm -f