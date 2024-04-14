#include <memory>

#include "Department.h"
#include "Faculty.h"
#include "University.h"

int main() {
  auto faculty = std::make_shared<Faculty>("Computer Science", 10);

  Department cse("Computer Science and Engineering", faculty.get());
  Department ibe("information and Biomeical Engineering");
  ibe.setFaculty(faculty.get());

  Department depts[3] = {Department("Math"), ibe, cse};
  University univ("Pusan National University", 3);
  univ.setDepartments(depts);

  univ.printInfo();

  return 0;
}