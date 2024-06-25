#include <iomanip>
#include <memory>
#include <numeric>

#include "Circle.h"
#include "Rectangle.h"
#include "Triangle.h"
using namespace std;

void doingSomething(const vector<unique_ptr<IShape>>& shapes) {
  for (const auto& s : shapes) cout << *s << endl;

  double totalArea = accumulate(shapes.cbegin(), shapes.cend(), 0.0,
                                [](double cur_sum, const auto& rhs) {
                                  return cur_sum + (*rhs).getArea();
                                });

  double totalPerimeter = accumulate(shapes.cbegin(), shapes.cend(), 0.0,
                                     [](double cur_sum, const auto& rhs) {
                                       return cur_sum + (*rhs).getPerimeter();
                                     });
  cout << std::fixed << std::setprecision(2);
  cout << "totalArea: " << totalArea << ", "
       << "totalPerimeter: " << totalPerimeter << endl;
}

int main() {
  std::vector<std::unique_ptr<IShape>> shapes;

  shapes.emplace_back(std::make_unique<Rectangle>(
      std::vector<Point>{{0, 0}, {0, 2}, {2, 2}, {2, 0}}));
  shapes.emplace_back(
      std::make_unique<Triangle>(std::vector<Point>{{0, 0}, {0, 2}, {2, 2}}));
  shapes.emplace_back(std::make_unique<Circle>(Point{0, 0}, 3));

  doingSomething(shapes);

  return 0;
}