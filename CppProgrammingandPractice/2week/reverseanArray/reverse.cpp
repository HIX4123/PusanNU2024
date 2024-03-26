#include <iostream>
#include <vector>

int main() {
  int length;
  std::cin >> length;
  std::vector<int> numbers(length);
  for (int i = 0; i < length; i++) {
    std::cin >> numbers[length - i - 1];
  }
  for (int i = 0; i < length; i++) {
    std::cout << numbers[i] << " ";
  }
}