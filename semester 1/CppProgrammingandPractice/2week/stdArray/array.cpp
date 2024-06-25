#include <algorithm>
#include <array>
#include <iostream>

int main() {
  std::array<int, 10> nums;
  for (int i = 0; i < 10; i++) {
    std::cin >> nums[i];
  }
  auto minmax = std::minmax_element(nums.begin(), nums.end());

  std::cout << *minmax.second << " " << *minmax.first << std::endl;
}