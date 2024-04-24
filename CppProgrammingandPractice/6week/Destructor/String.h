#include <cstddef>
#include <iostream>

class String {
 public:
  // String() : str_(nullptr), len_(0) {}
  String(const char* str);
  String(const String& rhs);
  String& operator=(const String& rhs);
  // ~String() noexcept;

  char& at(std::size_t index);
  void print(const char* str);

 private:
  char* str_;
  std::size_t len_;
};