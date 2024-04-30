#include "String.h"

String::String(const char* str)
    : str_(const_cast<char*>(str)), len_(strlen(str)) {}

String::String(const String& rhs) {
  if (this != &rhs) {
    delete[] str_;
    len_ = rhs.len_;
    str_ = new char[len_ + 1];
    std::copy(rhs.str_, rhs.str_ + rhs.len_ + 1, str_);
  }
}

String& String::operator=(const String& rhs) {
  if (this != &rhs) {
    delete[] str_;
    len_ = rhs.len_;
    str_ = new char[len_ + 1];
    std::copy(rhs.str_, rhs.str_ + rhs.len_ + 1, str_);
  }
  return *this;
}

String::~String() noexcept { std::cout << "Destructor" << std::endl; }

char& String::at(std::size_t index) { return str_[index]; }

void String::print(const char* str) {
  std::cout << str << ": " << str_ << ", size: " << len_ << std::endl;
}