#include <iostream>
#include <sstream>
#include <string>
#include <vector>

int main() {
  int num_array, num_query;
  std::cin >> num_array >> num_query;
  std::cin.ignore();

  std::vector<std::vector<int>> array(num_array);

  for (auto& i : array) {
    std::string line;
    std::getline(std::cin, line);

    std::istringstream iss(line);
    int num;
    while (iss >> num) {
      i.emplace_back(num);
    }
  }

  while (num_query--) {
    int i, j;
    std::cin >> i >> j;
    std::cout << array[i][j + 1] << std::endl;
  }
}