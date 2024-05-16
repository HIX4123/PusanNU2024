#include <string>

class Person {
 public:
  Person() : name_(""), number_(""){};
  Person(std::string name, std::string number);
  void modifyNumber(std::string number);
  void print() const;

 private:
  // your code here
  std::string name_;
  std::string number_;
};