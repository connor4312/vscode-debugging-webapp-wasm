clean:
	rm -rf main.js main.html main.wasm

build: clean
	emcc \
		-sEXPORTED_FUNCTIONS=_main,_Foo_Amazon,_Foo_Nile,_Foo_River \
		-O0 \
		-g3 \
		-std=c++17 \
		-fwasm-exceptions \
		-fdebug-compilation-dir=/ciroot \
		-o main.html \
		main.cpp

test:
	node main.js
