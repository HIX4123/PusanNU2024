#include "Complex.h"

Complex Complex::operator+(const Complex rhs) {
  return Complex(r + rhs.r, i + rhs.i);
}

Complex Complex::operator-(const Complex rhs) {
  return Complex(r - rhs.r, i - rhs.i);
}

std::ostream& operator<<(std::ostream& os, const Complex& c) {
  os << c.r << '+' << c.i << 'i';
  return os;
}