#include "Helper.h"

class Triangle : public IShape {
 public:
  ~Triangle() noexcept {
    std::cout << "Triangle destructor called" << std::endl;
  }

  double getArea() const override {
    return (calcDist(points[0], points[1]) * calcDist(points[1], points[2])) /
           2;
  }
  double getPerimeter() const override {
    return calcDist(points[0], points[1]) + calcDist(points[1], points[2]) +
           calcDist(points[2], points[0]);
  }

 private:
  std::string toString() const override {
    std::cout << "Triangle Area: " << getArea()
              << ", Perimeter: " << getPerimeter();
  }
};
