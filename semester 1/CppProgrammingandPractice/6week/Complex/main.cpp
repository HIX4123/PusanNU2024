#include <iostream>
#include <typeinfo>

#include "complex.h"

using namespace std;

int main() {
  Complex c1;
  Complex c11();  // function declaration
  Complex c2 = 1;
  Complex c3(1);
  Complex c4 = Complex();
  cout << c1 << '\n';
  cout << typeid(c11).name() << '\n';

  Complex c5{1, 2};
  Complex c6 = {1, 6};
  Complex c7{};
  Complex c8 = {};
  cout << c5 << '\n';
  cout << c5.add(c6) << '\n';
  cout << c5.add(1) << '\n';

  auto c9 = Complex{1};
  cout << typeid(c9).name() << '\n';
  auto c10 = Complex{1, 1};
  cout << typeid(c10).name() << '\n';

  return 0;
}