#include <iostream>

#include "StringSplitter.h"

int main() {
  std::string myString;
  std::getline(std::cin, myString);
  auto tokens = StringSplitter(myString).trim().removeNonAlnum().split(' ');

  for (auto& token : tokens) {
    std::cout << token << std::endl;
  }

  return 0;
}