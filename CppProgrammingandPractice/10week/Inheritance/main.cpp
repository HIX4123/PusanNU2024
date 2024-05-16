#include <iostream>
#include <string>
using namespace std;

class Person {
 private:
  std::string person_name;

 public:
  Person(std::string person_name = "");
  ~Person();

  void print();
};

Person::Person(std::string person_name) : person_name(person_name) {
  std::cout << "Person is constructed!" << std::endl;
}

Person::~Person() { std::cout << "Person is destructed!" << std::endl; }

void Person::print() {
  std::cout << "Person Name: " << person_name << std::endl;
}

class Student : public Person {
 private:
  std::string school_name;

 public:
  Student(std::string person_name = "", std::string school_name = "");
  ~Student();

  void print();
};

Student::Student(std::string person_name, std::string school_name)
    : Person{person_name}, school_name(school_name) {
  std::cout << "Student is constructed!" << std::endl;
}

Student::~Student() { std::cout << "Student is destructed!" << std::endl; }

void Student::print() {
  Person::print();
  std::cout << "School Name: " << school_name << std::endl;
}

int main() {
  Person p1{"Park"};
  p1.print();

  Student s1{"Kim", "PNU"};
  s1.print();

  return 0;
}