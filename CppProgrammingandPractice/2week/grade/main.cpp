#include <algorithm>
#include <iostream>
#include <vector>

struct Student {
  std::string name;
  int score;
};

int main() {
  int times;
  std::cout << "# of students:";
  std::cin >> times;

  std::vector<Student> students(times);

  for (int i = 0; i < times; i++) {
    std::cout << "name & score of student " << i + 1 << ":";
    std::cin >> students[i].name >> students[i].score;
  }

  int sum = 0;
  for (const auto& student : students) {
    sum += student.score;
  }
  std::cout << "The average score of the students is " << sum / times
            << std::endl;

  auto maxStudent = std::max_element(
      students.begin(), students.end(),
      [](const Student& a, const Student& b) { return a.score < b.score; });

  std::cout << "The student with the highest score is " << maxStudent->name
            << " with a score of " << maxStudent->score << std::endl;

  return 0;
}