#ifndef FACULTY_H
#define FACULTY_H

#include <string>

class Faculty {
 private:
  std::string name;
  int numMembers;

 public:
  Faculty(std::string name, int numMembers);

  Faculty* get();
  std::string getName();
  int getNumMembers();
};

Faculty::Faculty(std::string name, int numMembers)
    : name(name), numMembers(numMembers) {}

Faculty* Faculty::get() { return this; }

std::string Faculty::getName() { return name; }

int Faculty::getNumMembers() { return numMembers; }

#endif  // FACULTY_H