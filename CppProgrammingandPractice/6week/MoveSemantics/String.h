#include <stddef.h>

#include <cstring>
#include <iostream>
#include <string>
#include <utility>

class String {
 public:
  String();
  String(const char* str);
  String(const String& str);
  String& operator=(const String& str);
  String(String&& str) noexcept;
  String& operator=(String&& str) noexcept;
  ~String();
  const char* data() const;
  char& at(size_t);
  size_t size() const;
  void print(const char* str = "") const;

 private:
  void swap(String& str);
  size_t len;
  char* s;
};