#include <iostream>

#include "Complex.h"

int main() {
  std::array<int, 10> arr1 = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
  auto result1 = myFind(arr1, 100);
  if (result1 != end(arr1)) std::cout << "Found" << std::endl;

  std::array<char, 5> arr2 = {'a', 'b', 'c', 'd', 'e'};
  auto result2 = myFind(arr2, 'e');
  if (result2 != end(arr2)) std::cout << "Found: " << *result2 << std::endl;

  std::array<Complex, 5> arr3 = {Complex(0, 0), Complex(0, 1), Complex(1, 1),
                                 Complex(1, 2), Complex(2, 2)};
  auto result3 = myFind(arr3, Complex(2, 2));
  if (result3 != end(arr3)) std::cout << "Found: " << *result3 << std::endl;
}
