#include "String.h"

#include <cstring>
#include <iostream>
#include <utility>

void String::swap(String& str) {
  using std::swap;
  swap(s, str.s);
  swap(len, str.len);
}

String::String() : len(0), s(new char) { *s = 0; }

String::String(const char* str)
    : len(strlen(str)), s(new char[strlen(str) + 1]) {
  std::copy(str, str + len + 1, s);
}

String::String(const String& str) {
  if (this != &str) {
    len = str.len;
    s = new char[len + 1];
    std::copy(str.s, str.s + str.len + 1, s);
  }
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

String::String(String&& str) noexcept
    : len(std::move(str.len)), s(new char[len + 1]) {
  std::copy(str.s, str.s + str.len + 1, s);
  delete[] str.s;
  str.s = new char;
  *str.s = 0;
  str.len = 0;
}

String& String::operator=(String&& str) noexcept {
  if (this != &str) {
    s = new char[len + 1];
    len = std::move(str.len);
    std::copy(str.s, str.s + str.len + 1, s);
    delete[] str.s;
    str.s = new char;
    *str.s = 0;
    str.len = 0;
  }

  return *this;
}

String::~String() {
  if (s) delete[] s;
}

const char* String::data() const { return s; }

char& String::at(size_t pos) {
  if (len != 0 && pos < len) return s[pos];
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