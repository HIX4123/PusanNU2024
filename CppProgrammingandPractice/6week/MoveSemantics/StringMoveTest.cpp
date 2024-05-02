#include <vector>

#include "String.h"

void printString(String s) { s.print("printCopyString"); }

String createName() {
  String name{"Kim"};
  return name;
}

int main() {
  String s1 = createName();
  s1.print("s1");   // s1: Kim, size: 3
  printString(s1);  // printCopyString: Kim, size: 3

  printString("acb");          // printCopyString: acb, size: 3
  printString(createName());   // printCopyString: Kim, size: 3
  printString(std::move(s1));  //! printCopyString: 8?, size: 3

  String s2;
  s2 = s1;
  s1.print("s1");
  s2.print("s2");

  String s3 = "DEF";
  String s4 = std::move(s3);
  s3.print("s3");
  s4.print("s4");

  try {
    s3.at(0) = 'a';
    s2.print("s2");
    s3.print("s3");
  } catch (std::out_of_range& ex) {
    std::cout << ex.what() << std::endl;
  }
  s3 = "HIG";

  std::vector<String> vec1;
  vec1.push_back(std::move(s1));
  vec1.push_back(std::move(s2));
  vec1.push_back(std::move(s3));
  vec1.push_back(std::move(s4));

  std::vector<String> vec2(4);
  vec2 = std::move(vec1);

  for (auto& s : vec2) s.print();

  // compare std::string with our String

  std::string sa = "SSS";
  std::string sb;
  sb = std::move(sa);

  try {
    sa.at(0) = 'A';
    std::cout << sa << std::endl;
    std::cout << sb << std::endl;
  } catch (std::out_of_range& ex) {
    std::cout << "exception!" << std::endl;
  }

  String s9 = std::move(createName());
  printString(std::move(createName()));
  
  String s10;
  s10 = std::move(createName());
  s10 = std::move(s10);
  s10.print("s10");
}