#include <ostream>

class Complex {
 public:
  Complex(double real = 0, double imaginary = 0) : r(real), i(imaginary){};
  // operator <<를 구현하시오 (free 함수로 구현)
  friend std::ostream& operator<<(std::ostream& os, const Complex& c);

 private:
  double r{0}, i{0};
};

std::ostream& operator<<(std::ostream& os, const Complex& c);