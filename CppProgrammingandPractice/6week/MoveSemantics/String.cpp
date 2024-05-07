#include "String.h"

void String::swap(String& str) {
  using std::swap;
  swap(s, str.s);
  swap(len, str.len);
}

String::String() : len(0), s(nullptr) {}

String::String(const char* str)
    : len(str ? strlen(str) : 0), s(str ? new char[len + 1] : nullptr) {
  if (str) std::copy(str, str + len + 1, s);
}

String::String(const String& str)
    : len(str.len), s(str.s ? new char[len + 1] : nullptr) {
  if (str.s) std::copy(str.s, str.s + str.len + 1, s);
}

String& String::operator=(const String& str) {
  if (this != &str) {
    delete[] s;
    len = str.len;
    if (len) {
      s = new char[len + 1];
      std::copy(str.s, str.s + str.len + 1, s);
    } else {
      s = nullptr;
    }
  }

  return *this;
}

String::String(String&& str) noexcept
    : len(std::move(str.len)), s(std::move(str.s)) {
  str.len = 0;
  str.s = nullptr;
}

String& String::operator=(String&& str) noexcept {
  s = std::move(str.s);
  len = std::move(str.len);

  str.s = nullptr;
  str.len = 0;

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
  std::cout << str << ": " << s << ", size: " << len << " address: " << (void*)s
            << std::endl;
  // std::cout << str << ": " << s << ", size: " << len << std::endl;
}