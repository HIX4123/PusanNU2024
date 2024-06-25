#include <iostream>
#include <vector>

extern std::vector<int> vec;

void read() {
  int count, response;
  std::cin >> count;
  for (int i = 0; i < count; i++) {
    std::cin >> response;
    vec.emplace_back(response);
  }
}