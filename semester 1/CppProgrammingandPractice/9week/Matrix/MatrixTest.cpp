#include <iostream>

#include "Matrix.h"

using namespace std;

void print_matrix(string name, Matrix m) {
  cout << name << endl;
  cout << m << endl;
}

int main() {
  Matrix m1 = {{4, 1}, {-7, -3}};
  Matrix m2 = {{1, 1}, {0, 0}};

  Matrix m3(m1 + m2);
  Matrix m4 = m3;

  print_matrix("m3", m3);
  print_matrix("m4", m4);
  print_matrix("m4.inverse", m4.inverse());

  Matrix m5 = {{}};
  print_matrix("m5", m5);
  print_matrix("m5.inverse", m5.inverse());

  Matrix m6(m5);
  print_matrix("m6", m6);
  print_matrix("m6.inverse", m6.inverse());

  Matrix m7 = m4.inverse();
  m7 = m7 + Matrix({{0, 0}, {8, 6}});

  print_matrix("m4", m4);
  print_matrix("m4.inverse", m4.inverse());

  print_matrix("m7", m7);
  print_matrix("m7.inverse", m7.inverse());
}
