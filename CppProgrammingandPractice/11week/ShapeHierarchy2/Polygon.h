#include "Helper.h"

class Polygon : public IShape {
 public:
  Polygon(const std::vector<Point>& points) : IShape(points) {}
  ~Polygon() noexcept { std::cout << "Polygon destructor called" << std::endl; }

  double getArea() const override {
    double area = 0.0;
    std::vector<Point>::size_type n = points.size();
    for (std::vector<Point>::size_type i = 0; i < n; i++) {
      std::vector<Point>::size_type j = (i + 1) % n;
      area += (points[i].x * points[j].y - points[j].x * points[i].y);
    }
    return std::abs(area) / 2.0;
  }

  double getPerimeter() const override {
    double perimeter = 0.0;
    std::vector<Point>::size_type n = points.size();
    for (std::vector<Point>::size_type i = 0; i < n; i++) {
      std::vector<Point>::size_type j = (i + 1) % n;
      perimeter += calcDist(points[i], points[j]);
    }
    return perimeter;
  }

 private:
  std::string toString() const override {
    std::ostringstream oss;
    oss << std::setprecision(2) << std::fixed << "Polygon Area: " << getArea()
        << ", Perimeter: " << getPerimeter();
    return oss.str();
  }
};
