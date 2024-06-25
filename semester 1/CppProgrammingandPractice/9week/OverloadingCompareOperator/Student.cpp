#include "Student.h"

std::ostream& operator<<(std::ostream& os, const Student& student) {
  os << "Id: " << student.id << " Name: " << student.name
     << " Grade: " << student.grade;
  return os;
}

int compareByGrade(const Student& a, const Student& b) {
  return a.grade > b.grade;
}

int Student::operator<(const Student& rhs) {
  return name.compare(rhs.name) < 0;
}