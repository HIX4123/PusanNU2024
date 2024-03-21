#include <iostream>
#include <vector>

extern std::vector<int> vec;

void read() {
  int response;
  std::cin >> response;
  for (int i = 0; i < response; i++) {
    std::cin >> response;
    vec.emplace_back(response);
  }
}