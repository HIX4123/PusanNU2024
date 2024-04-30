#include "String.h"

#include <algorithm>
#include <iostream>

void String::swap(String& str) {
  using std::swap;
  swap(s, str.s);
  swap(len, str.len);
}

String::~String() {
  if (s) delete[] s;
}

const char* String::data() const { return s; }
char& String::at(size_t pos) {
  if (len != 0 && 0 <= pos && pos < len) return s[pos];
  throw std::out_of_range("out of range at index: " + std::to_string(pos) +
                          ", but the length of String is " +
                          std::to_string(len));
}

size_t String::size() const { return len; }

void String::print(const char* str) const {
  // for debugging
  // std::cout << str << ": " << s << ", size: " << len << " address: " << (void
  // *) s << std::endl;
  std::cout << str << ": " << s << ", size: " << len << std::endl;
}