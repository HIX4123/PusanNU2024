#include "Helper.h"

class Circle : public IShape {
 public:
  Circle(const Point& point, int radius) : _point(point), _radius(radius) {}
  ~Circle() noexcept override {
    std::cout << "Circle destructor called" << std::endl;
  }

  double getArea() const override { return 3.14159 * _radius * _radius; }
  double getPerimeter() const override { return 6.28318 * _radius; }

 private:
  std::string toString() const override {
    std::ostringstream oss;
    oss << std::setprecision(2) << std::fixed << "Circle Area: " << getArea()
        << ", Perimeter: " << getPerimeter();
    return oss.str();
  }

  Point _point;
  int _radius;
};
