#include <iostream>

#include "Rectangle.h"

int main() {
  double x1, y1, x2, y2;
  std::cin >> x1 >> y1 >> x2 >> y2;
  Rectangle rectangle{x1, y1, x2, y2};
  std::cout << rectangle.area() << std::endl;
}