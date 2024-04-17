#include <cstddef>

class String {
 public:
  String(const char* str);
  String& operator=(const String& rhs);
  char& at(int index);
  void print(const char* name) const;
  ~String();

 private:
  char* str_;
  size_t length_;
};