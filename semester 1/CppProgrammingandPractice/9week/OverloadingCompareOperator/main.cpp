#include <algorithm>
#include <iostream>
#include <map>
#include <vector>

#include "Student.h"

int main() {
  std::map<int, Student> student_grades;

  // Insert 5 student objects into the map
  student_grades[1] = {1, "Bob", 90};
  student_grades[2] = {2, "Alice", 85};
  student_grades[3] = {3, "David", 80};
  student_grades[4] = {4, "Eve", 95};
  student_grades[5] = {5, "Charlie", 88};

  std::cout << "********** In order of their id" << std::endl;
  for (const auto& [id, student] : student_grades) {
    std::cout << student << std::endl;
  }

  std::vector<Student> students;

  // This is because std::sort requires random access iterators, but std::map
  // iterators are bidirectional iterators, and this causes the error.

  for (const auto& [id, student] : student_grades) {
    students.push_back(student);
  }

  std::sort(students.begin(), students.end(), compareByGrade);

  std::cout << "********** In descending order of their grade" << std::endl;
  for (const auto& student : students) {
    std::cout << student << std::endl;
  }

  std::sort(students.begin(), students.end());

  std::cout << "********** In order of their name" << std::endl;
  for (const auto& student : students) {
    std::cout << student << std::endl;
  }
  return 0;
}