#include "Helper.h"

class Rectangle : public IShape {
 public:
  ~Rectangle() noexcept {
    std::cout << "Rectangle destructor called" << std::endl;
  }

  double getArea() const override {
    return calcDist(points[0], points[1]) * calcDist(points[1], points[2]);
  }
  double getPerimeter() const override {
    return (calcDist(points[0], points[1]) + calcDist(points[1], points[2])) *
           2;
  }

 private:
  std::string toString() const override {
    std::cout << "Rectangle Area: " << getArea()
              << ", Perimeter: " << getPerimeter();
  }
};
