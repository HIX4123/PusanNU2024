#include <iostream>

#include "pointer.h"
using namespace std;

int main() {
  int a, b;
  int* pA = &a;
  int* pB = &b;
  cin >> *pA >> *pB;
  update(&a, &b);
  cout << a << endl;
  cout << b << endl;
}