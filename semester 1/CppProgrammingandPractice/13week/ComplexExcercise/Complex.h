#include <array>
#include <cstddef>
#include <ostream>

template <typename T, size_t N>
auto myFind(std::array<T, N>& arr, T target) {
  for (auto& element : arr) {
    if (element == target) {
      return &element;
    }
  }
  return arr.end();
}

class Complex {
 private:
  double _real;
  double _imaginary;

 public:
  Complex(double real = 0.0, double imaginary = 0.0)
      : _real(real), _imaginary(imaginary) {}

  double getReal() const { return _real; }

  double getImaginary() const { return _imaginary; }

  void setReal(double real) { this->_real = real; }

  void setImaginary(double imaginary) { this->_imaginary = imaginary; }

  Complex operator+(const Complex& other) const {
    return Complex(_real + other._real, _imaginary + other._imaginary);
  }

  Complex operator-(const Complex& other) const {
    return Complex(_real - other._real, _imaginary - other._imaginary);
  }

  Complex operator*(const Complex& other) const {
    double newReal = _real * other._real - _imaginary * other._imaginary;
    double newImaginary = _real * other._imaginary + _imaginary * other._real;
    return Complex(newReal, newImaginary);
  }

  Complex operator/(const Complex& other) const {
    double denominator =
        other._real * other._real + other._imaginary * other._imaginary;
    double newReal =
        (_real * other._real + _imaginary * other._imaginary) / denominator;
    double newImaginary =
        (_imaginary * other._real - _real * other._imaginary) / denominator;
    return Complex(newReal, newImaginary);
  }

  bool operator==(const Complex& other) const {
    return (_real == other._real) && (_imaginary == other._imaginary);
  }

  bool operator!=(const Complex& other) const { return !(*this == other); }

  friend std::ostream& operator<<(std::ostream& os, const Complex& complex) {
    os << complex._real << " + " << complex._imaginary << "i";
    return os;
  }
};