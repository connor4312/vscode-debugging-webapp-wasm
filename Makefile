clean:
	rm -rf main.js main.html main.wasm
	rm -rf build-dbg

build: clean
	mkdir build-dbg

	docker run \
		--rm \
		-v $(shell pwd):/src \
		-u $(shell id -u):$(shell id -g) \
		emscripten/emsdk \
			emcc \
			-sEXPORTED_FUNCTIONS=_main,_Foo_Amazon,_Foo_Nile,_Foo_River \
			-O0 \
			-g3 \
			-std=c++17 \
			-fwasm-exceptions \
			-gseparate-dwarf=build-dbg/fbl-min-test.debug.wasm \
			-sSEPARATE_DWARF_URL=http://localhost:3000/build-dbg/fbl-min-test.debug.wasm \
			-o main.html \
			main.cpp

serve:
	npx serve

test:
	node main.js
