#ifndef COMPLEX_COMPLEX_H
#define COMPLEX_COMPLEX_H
#include <iostream>

class complex {
 public:
  // 필요한 생성자를 추가하시오!
  complex(double real = 0, double imaginary = 0) : r(real), i(imaginary) {}
  complex add(const complex& c) { return {r + c.r, i + c.i}; };
  friend std::ostream& operator<<(std::ostream& os, const complex& c);

 private:
  double r{0}, i{0};
};

std::ostream& operator<<(std::ostream& os, const complex& c) {
  std::cout << c.r << " + " << c.i << "i";
  return os;
}

#endif  // COMPLEX_COMPLEX_H