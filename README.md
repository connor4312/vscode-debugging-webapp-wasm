# webapp

Trying to configure the `WebAssembly DWARF Debugging` extension with specific assumptions.

## Assumptions

* Use `-fdebug-compilation-dir=/ciroot`

## Steps to reproduce

* Setup emscripten
* Compile code using `make build`
* Open VSCode workspace `webapp.code-workspace`
  * Install `ms-vscode.wasm-dwarf-debugging` extension
* Set breakpoint in `main.cpp`
* Serve http server `python3 -m http.server 8888`
* Run `Launch Chrome` configuration

**Breakpoint don't work.**

PS: Breakpoints works without `-fdebug-compilation-dir=/ciroot`, see `Makefile`.

### Setup emscripten

    ### Activate PATH and other environment variables in the current terminal
    ### https://emscripten.org/docs/getting_started/downloads.html
    source ~/.emsdk/emsdk_env.sh

    ### Check emsdk version, eg:
    ### > emcc (Emscripten gcc/clang-like replacement + linker emulating GNU ld) 3.1.61 (67fa4c16496b157a7fc3377afd69ee0445e8a6e3) ...
    emcc --version
