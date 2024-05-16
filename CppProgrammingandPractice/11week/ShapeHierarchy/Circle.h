#include "Helper.h"

class Circle : public IShape {
 public:
  Circle(const Point point, int radius) : _point(point), _radius(radius) {}
  ~Circle() noexcept { std::cout << "Circle destructor called" << std::endl; }

  double getArea() const override { return 3.14159 * _radius * _radius; }
  double getPerimeter() const override { return 6.18318 * _radius; }

 private:
  std::string toString() const override {
    std::cout << "Circle Area: " << getArea()
              << ", Perimeter: " << getPerimeter();
  }
  Point _point;
  int _radius;
};
