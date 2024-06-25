#include <string>

#include "Faculty.h"

class Department {
 private:
  std::string name;
  Faculty* faculty;

 public:
  Department(std::string name, Faculty* faculty = nullptr);

  void setFaculty(Faculty* faculty);

  std::string getName();
  Faculty* getFaculty();
};

Department::Department(std::string name, Faculty* faculty)
  : name(name), faculty(faculty) {
}

void Department::setFaculty(Faculty* faculty) {
  this->faculty = faculty;
}

std::string Department::getName() { return name; }

Faculty* Department::getFaculty() { return faculty; }