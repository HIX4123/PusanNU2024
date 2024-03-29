#include <iostream>
#include <sstream>
#include <string>
#include <vector>

int main() {
  int vectors, questions;
  std::cin >> vectors >> questions;

  std::vector<std::vector<int>> vec(vectors);

  for (int i = 0; i < vectors; i++) {
    std::string input;
    std::getline(std::cin, input);
    std::istringstream iss(input);

    int num;
    while (iss >> num) {
      vec[i].emplace_back(num);
    }
  }
}
