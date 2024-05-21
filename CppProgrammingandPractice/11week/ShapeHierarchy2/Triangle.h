#include "Helper.h"

class Triangle : public IShape {
 public:
  Triangle(const std::vector<Point>& points) : IShape(points) {}
  ~Triangle() noexcept {
    std::cout << "Triangle destructor called" << std::endl;
  }

  double getArea() const override {
    double side1 = calcDist(points[0], points[1]);
    double side2 = calcDist(points[1], points[2]);
    double side3 = calcDist(points[2], points[0]);
    double semiperimeter = (side1 + side2 + side3) / 2;
    return std::sqrt(semiperimeter * (semiperimeter - side1) *
                     (semiperimeter - side2) * (semiperimeter - side3));
  }

  double getPerimeter() const override {
    return calcDist(points[0], points[1]) + calcDist(points[1], points[2]) +
           calcDist(points[2], points[0]);
  }

 private:
  std::string toString() const override {
    std::ostringstream oss;
    oss << std::setprecision(2) << std::fixed << "Triangle Area: " << getArea()
        << ", Perimeter: " << getPerimeter();
    return oss.str();
  }
};
