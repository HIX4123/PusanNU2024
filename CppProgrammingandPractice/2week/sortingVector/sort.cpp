#include <algorithm>
#include <iostream>
#include <vector>

int main() {
  int length;
  std::cin >> length;

  std::vector<int> vec(length);
  for (int i = 0; i < length; i++) {
    std::cin >> vec[i];
  }

  std::sort(vec.begin(), vec.end());

  for (int i = 0; i < length; i++) {
    std::cout << vec[i] << ' ';
  }
}