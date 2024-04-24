#include "String.h"

#include <cstring>
#include <iostream>

String::String() : len(0), s(new char) { *s = '\0'; }
String::String(const char* str) : len(std::strlen(str)), s(new char[len + 1]) {
  std::copy(str, str + len + 1, s);
}
String::String(const String& str) : len(str.len), s(new char[str.len + 1]) {
  std::copy(str.s, str.s + len + 1, s);
}

String& String::operator=(const String& str) {
  if (this != &str) {
    delete[] s;
    len = str.len;
    s = new char[len + 1];
    std::copy(str.s, str.s + str.len + 1, s);
  }
  return *this;
}

String::~String() { delete[] s; }

const char* String::data() const { return s; }

char& String::at(size_t i) { return s[i]; }

size_t String::size() const { return len; }

void String::print(const char* str) const {
  std::cout << str << ": " << s << ", size: " << len << std::endl;
}

void String::swap(String& str) {
  std::swap(len, str.len);
  std::swap(s, str.s);
}