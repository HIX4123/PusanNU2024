#include <ostream>
#include <string>

class Student {
 public:
  Student(int id = 0, std::string name = "", int grade = 0)
      : id(id), name(name), grade(grade){};

  friend std::ostream& operator<<(std::ostream& os, const Student& student);
  friend int compareByGrade(const Student& a, const Student& b);
  
  int operator<(const Student& rhs);

 private:
  int id{0};
  std::string name{""};
  int grade{0};
};

std::ostream operator<<(std::ostream& os, Student& student);
int compareByGrade(const Student& a, const Student& b);