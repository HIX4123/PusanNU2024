#include <iostream>
#include <map>

#include "Person.h"

int main() {
  int n;
  std::cin >> n;

  std::string query, name, number;

  std::map<std::string, Person> persons;

  for (int i = 0; i < n; i++) {
    std::cin >> name >> number;
    persons[name] = Person(name, number);
  }

  for (;; std::cin >> query) {
    if (query == "ADD" or query == "MOD") {
      std::cin >> name >> number;
      persons[name] = Person(name, number);
    } else if (query == "DEL") {
      std::cin >> name;
      persons.erase(name);
    } else if (query == "FIN") {
      std::cin >> name;
      persons[name].print();
    } else if (query == "QUI") {
      for (auto i : persons) i.second.print();
      break;
    }
  }
}