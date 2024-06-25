#include "Person.h"

#include <iostream>

Person::Person(std::string name, std::string number)
    : name_(name), number_(number) {
  // your code here
}

void Person::modifyNumber(std::string number) {
  // your code here
  number_ = number;
}

void Person::print() const {
  // your code here
  std::cout << name_ << " " << number_ << std::endl;
}