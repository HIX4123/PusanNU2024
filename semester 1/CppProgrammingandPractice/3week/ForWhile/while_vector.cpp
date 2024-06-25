#include <algorithm>
#include <iostream>
#include <vector>

int main() {
  std::vector<int> numbers;
  int number;

  while (std::cin >> number) {
    numbers.push_back(number);
  }

  auto minmax = std::minmax_element(numbers.begin(), numbers.end());
  std::cout << numbers.size() << " " << *minmax.first << " " << *minmax.second
            << std::endl;
}