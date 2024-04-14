#include <iostream>

class Complex {
 public:
  Complex(int real = 0, int imag = 0) : real(real), imag(imag) {}
  Complex operator+(const Complex& other) {
    return Complex(real + other.real, imag + other.imag);
  }
  Complex operator-(const Complex& other) {
    return Complex(real - other.real, imag - other.imag);
  }
  Complex operator*(const Complex& other) {
    return Complex(real * other.real - imag * other.imag,
                   real * other.imag + imag * other.real);
  }
  Complex operator/(const Complex& other) {
    return Complex((real * other.real + imag * other.imag) /
                       (other.real * other.real + other.imag * other.imag),
                   (imag * other.real - real * other.imag) /
                       (other.real * other.real + other.imag * other.imag));
  }
  void print() { std::cout << real << " " << imag << std::endl; }

 private:
  int real;
  int imag;
};

class ComplexList {
 public:
  ComplexList(int size) : size(size) {
    list = new Complex[size];
    for (int i = 0; i < size; i++) {
      int real, imag;
      std::cin >> real >> imag;
      list[i] = Complex(real, imag);
    }
  }
  ~ComplexList() { delete[] list; }
  Complex sum() {
    Complex sum;
    for (int i = 0; i < size; i++) {
      sum = sum + list[i];
    }
    return sum;
  }
  Complex sub() {
    Complex sub = list[0];
    for (int i = 1; i < size; i++) {
      sub = sub - list[i];
    }
    return sub;
  }
  Complex mul() {
    Complex mul = list[0];
    for (int i = 1; i < size; i++) {
      mul = mul * list[i];
    }
    return mul;
  }
  Complex div() {
    Complex div = list[0];
    for (int i = 1; i < size; i++) {
      div = div / list[i];
    }
    return div;
  }

 private:
  int size;
  Complex* list;
};

int main() {
  int n;
  std::cin >> n;
  ComplexList complex_list(n);
  complex_list.sum().print();
  complex_list.sub().print();
  complex_list.mul().print();
  complex_list.div().print();
  return 0;
}