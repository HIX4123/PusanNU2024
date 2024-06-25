#include <iomanip>
#include <iostream>

#include "Cell.h"
#include "Excel.h"

int main() {
  std::vector<std::vector<Cell>> data = {
      {Cell("name"), Cell("C++"), Cell("Java")},
      {Cell("Kim"), Cell(87), Cell(75.7)},
      {Cell("Lee"), Cell(90), Cell(80.6)},
      {Cell("Park"), Cell(70), Cell(90.0)}};

  Excel excel(data);

  std::cout << std::fixed;
  std::cout << std::setprecision(1);
  double score = excel.average(1, 1, 3, 1);
  std::cout << "C++ Avg. Score: " << score << std::endl;
  score = excel.average(1, 2, 3, 2);
  std::cout << "Java Avg. Score: " << score << std::endl;
}