#include <iostream>
#include <map>
#include <string>

int main() {
  std::map<std::string, std::string> phonebook;
  int count;
  std::string name;
  std::string number;
  std::cin >> count;
  for (int i = 0; i < count; i++) {
    std::cin >> name >> number;
    phonebook.insert(std::make_pair(name, number));
  }