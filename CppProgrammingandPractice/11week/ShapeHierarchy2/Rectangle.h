#include "Helper.h"

class Rectangle : public IShape {
 public:
  Rectangle(const std::vector<Point>& points) : IShape(points) {}
  ~Rectangle() noexcept {
    std::cout << "Rectangle destructor called" << std::endl;
  }

  double getArea() const override {
    double width = calcDist(points[0], points[1]);
    double height = calcDist(points[1], points[2]);
    return width * height;
  }

  double getPerimeter() const override {
    double width = calcDist(points[0], points[1]);
    double height = calcDist(points[1], points[2]);
    return 2 * (width + height);
  }

 private:
  std::string toString() const override {
    std::ostringstream oss;
    oss << std::setprecision(2) << std::fixed << "Rectangle Area: " << getArea()
        << ", Perimeter: " << getPerimeter();
    return oss.str();
  }
};
