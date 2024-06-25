#include <iostream>
#include <vector>

int main() {
  int length;
  std::cin >> length;
  std::vector<int> numbers(length);

  for (int i = 0; i < length; i++) {
    std::cin >> numbers[i];
  }

  int sum = 0;
  for (int number : numbers) {
    sum += number;
  }
  std::cout << sum;
}
