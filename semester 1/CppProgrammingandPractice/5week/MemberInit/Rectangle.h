#include "Point.h"

class Rectangle {
 public:
  // implements the constuctor with member initializer list
  Rectangle(double x1, double y1, double x2, double y2);
  double area() const;

 private:
  Point leftTop, rightBottom;
};