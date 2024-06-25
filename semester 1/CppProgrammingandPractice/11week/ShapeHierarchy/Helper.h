#include <cmath>

#include "IShape.h"

#ifndef CALCDIST
#define CALCDIST

double calcDist(const Point& p1, const Point& p2) {
  int dx = p2.x - p1.x;
  int dy = p2.y - p1.y;
  return std::sqrt(dx * dx + dy * dy);
}

#endif