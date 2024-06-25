#include "Complex.h"

std::ostream& operator<<(std::ostream& os, const Complex& c) {
  os << c.r << '+' << c.i << 'i';
  return os;
}