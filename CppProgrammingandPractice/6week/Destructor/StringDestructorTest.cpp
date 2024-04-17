#include "String.h"

int main() {
  String str1{"abc"};
  String str2 = str1;
  str2.at(0) = 'b';
  str1.print("str1");
  str2.print("str2");
}