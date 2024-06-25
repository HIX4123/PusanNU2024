#include <cstddef>
#include <cstring>
#include <iostream>

class String {
 public:
  String(const char* str);
  String(const String& rhs);
  String& operator=(const String& rhs);
  ~String() noexcept;

  char& at(std::size_t index);
  void print(const char* str);

 private:
  char* str_ = nullptr;
  std::size_t len_ = 0;
};