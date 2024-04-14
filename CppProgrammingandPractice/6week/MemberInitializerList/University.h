#include <iostream>

class University {
 private:
  std::string name;
  int numDepartments;
  Department* depts;

 public:
  University(std::string name, int numDepartments, Department* depts = nullptr);

  void setDepartments(Department* depts);
  void printInfo();
};

University::University(std::string name, int numDepartments, Department* depts)
    : name(name), numDepartments(numDepartments), depts(depts) {}

void University::setDepartments(Department* depts) { this->depts = depts; }

void University::printInfo() {
  std::cout << "University Name: " << name << std::endl;
  std::cout << "Number of Departments: " << numDepartments << std::endl
            << std::endl;

  for (Department* dept = depts; dept < depts + numDepartments; ++dept) {
    std::cout << "Department Name: " << dept->getName() << std::endl;

    std::string facultyname;
    std::string facultymembers;
    if (dept->getFaculty() != nullptr) {
      facultyname = dept->getFaculty()->getName();
      facultymembers = std::to_string(dept->getFaculty()->getNumMembers());
    } else {
      facultyname = "N/A";
      facultymembers = "N/A";
    }

    std::cout << "Faculty Name: " << facultyname << std::endl;
    std::cout << "Number of Faculty Members: " << facultymembers << std::endl
              << std::endl;
    continue;
  }
}