#include <iostream>


int main() {
  int grade;
  std::cin >> grade;

  if (grade >= 90) {
    std::cout << "A" << std::endl;
  } else if (grade >= 80) {
    std::cout << "B" << std::endl;
  } else if (grade >= 70) {
    std::cout << "C" << std::endl;
  } else if (grade >= 60) {
    std::cout << "D" << std::endl;
  } else {
    std::cout << "F" << std::endl;
  }
}