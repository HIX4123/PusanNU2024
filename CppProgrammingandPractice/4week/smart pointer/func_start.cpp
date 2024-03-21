#include <iostream>
#include <memory>
#include <string>
#include <vector>

struct STUDENT {
  std::string name;
  int age;
};

std::unique_ptr<STUDENT> createStuent(std::string name, int age) {
  auto student = std::unique_ptr<STUDENT>(new STUDENT());
  student->name = name;
  student->age = age;
  return student;
}

void printStudentInfo(const STUDENT& student) {
  std::cout << student.name << " " << student.age << std::endl;
}

int main() {
  int response;
  std::cin >> response;
  std::vector<STUDENT> students(response);

  for (int i = 0; i < response; i++) {
    std::string name;
    int age;
    std::cin >> name >> age;
    students.emplace_back(*createStuent(name, age));
  }

  for (const auto& student : students) {
    printStudentInfo(student);
  }
  return 0;
}