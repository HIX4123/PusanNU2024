#include <vector>
#include <memory>

#include "patient.h"

int main() {
  size_t size;
  std::cin >> size;

  std::vector<std::unique_ptr<PatientInfo>> patients(size);
  for (size_t i = 0; i < size; ++i) {
    patients[i] = std::unique_ptr<PatientInfo>(new PatientInfo);
    std::cin >> patients[i]->name >> patients[i]->age >> patients[i]->height >>
        patients[i]->weight;
    patients[i]->bmi =
        patients[i]->weight / (patients[i]->height * patients[i]->height);
  }

  std::string command;
  while (std::getline(std::cin, command)) {
    auto [name, value] = parse(command);
    if (name == "sort: ") {
      sort(patients, size, value.c_str());
    } else if (name == "search: ") {
      search(patients, size, value.c_str());
    } else if (name == "list: ") {
      list(patients, size, value.c_str());
    } else if (name == "remove: ") {
      remove(patients, size, value.c_str());
    }
  }
}
