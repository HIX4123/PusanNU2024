#include <iostream>

#include "Complex.h"

int main() {
  Complex c1(3, 2), c2(1, 1);
  Complex c3(c1);
  std::cout << c1 << std::endl;
  std::cout << c2 << std::endl;
  std::cout << c3 << std::endl;
}