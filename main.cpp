#include <iostream>
#include <stdexcept>

extern "C" {

void Foo_Amazon() {
    std::cout << "Foo_Amazon" << std::endl;
    throw std::runtime_error("Amazon");
}

void Foo_Nile() {
    std::cout << "Foo_Nile" << std::endl;
}

void Foo_River() {
    std::cout << "Foo_River" << std::endl;
    Foo_Amazon();
}
}

int main() {
    std::cout << "hello world" << std::endl;
    Foo_Nile();
    Foo_River();
}
