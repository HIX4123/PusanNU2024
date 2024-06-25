#include <iostream>
#include <string>

void println(const std::string& str) { std::cout << str << std::endl; }

int main() {
  std::string str = "hello, world!";
  println(str);
  for (int i = 0; i < 3; i++) {
    println(str);
  }
}