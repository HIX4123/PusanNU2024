#include <string>
#include <iostream>

struct PatientInfo {
  char name[20];
  int age;
  double height;
  double weight;
  double bmi;
};

std::pair<std::string, std::string> parse(const std::string& command);

void sort(std::unique_ptr<PatientInfo>* patients, size_t size,
          const char* value);
void search(PatientInfo* patients, size_t size, const char* value);
void list(PatientInfo* patients, size_t size, const char* value);
void remove(PatientInfo* patients, size_t size, const char* value);
