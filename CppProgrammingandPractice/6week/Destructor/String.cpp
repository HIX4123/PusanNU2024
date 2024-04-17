#include "String.h"

#include <cstring>
#include <iostream>

String::String(const char* str) {
  length_ = strlen(str);
  str_ = new char[length_ + 1];
  strcpy(str_, str);
}

String& String::operator=(const String& rhs) {
  if (this != &rhs) {
    delete[] str_;
    length_ = rhs.length_;
    str_ = new char[length_ + 1];
    strcpy(str_, rhs.str_);
  }
  return *this;
}

char& String::at(int index) { return str_[index]; }

void String::print(const char* name) const {
  std::cout << name << ": " << str_ << std::endl;
}

String::~String() { delete[] str_; }