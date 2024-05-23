#include "patient.h"

#include <algorithm>

std::pair<std::string, std::string> parse(const std::string& command) {
  std::string name;
  std::string value;
  size_t spaceIndex = command.find(' ');
  if (spaceIndex != std::string::npos) {
    name = command.substr(0, spaceIndex);
    value = command.substr(spaceIndex + 1);
  }
  return std::make_pair(name, value);
}

void printPatient(const PatientInfo& patient) {
  std::cout << patient.name << " " << patient.age << " " << patient.height
            << " " << patient.weight << " " << patient.bmi << std::endl;
}

void sort(std::unique_ptr<PatientInfo>* patients, size_t size,
          const char* value) {
  if (value == "asc") {
    std::sort(patients, patients + size,
              [](const std::unique_ptr<PatientInfo>& lhs,
                 const std::unique_ptr<PatientInfo>& rhs) {
                return lhs->bmi < rhs->bmi;
              });
  } else if (value == "desc") {
    std::sort(patients, patients + size,
              [](const std::unique_ptr<PatientInfo>& lhs,
                 const std::unique_ptr<PatientInfo>& rhs) {
                return lhs->bmi > rhs->bmi;
              });
  }

  for (size_t i = 0; i < size; ++i) {
    printPatient(*patients[i]);
  }
}

void search(std::unique_ptr<PatientInfo>* patients, size_t size,
            const char* value) {
  for (size_t i = 0; i < size; ++i) {
    if (patients[i]->name == value) {
      printPatient(*patients[i]);
    }
  }
}

void list(std::unique_ptr<PatientInfo>* patients, size_t size,
          const char* value) {
  auto [sigh, threshold] = parse(value);
  if (sigh == "<") {
    for (size_t i = 0; i < size; ++i) {
      if (patients[i]->bmi < std::stod(threshold)) {
        printPatient(*patients[i]);
      }
    }
  } else if (sigh == ">") {
    for (size_t i = 0; i < size; ++i) {
      if (patients[i]->bmi > std::stod(threshold)) {
        printPatient(*patients[i]);
      }
    }
  }
}

void remove(std::unique_ptr<PatientInfo>* patients, size_t size,
            const char* value) {
  auto [sigh, threshold] = parse(value);
  if (sigh == "<") {
    size_t newSize = 0;
    for (size_t i = 0; i < size; ++i) {
      if (patients[i]->bmi >= std::stod(threshold)) {
        patients[newSize++] = std::move(patients[i]);
      }
    }
    size = newSize;
  } else if (sigh == ">") {
    size_t newSize = 0;
    for (size_t i = 0; i < size; ++i) {
      if (patients[i]->bmi <= std::stod(threshold)) {
        patients[newSize++] = std::move(patients[i]);
      }
    }
    size = newSize;
  }
  for (size_t i = 0; i < size; ++i) {
    printPatient(*patients[i]);
  }
}