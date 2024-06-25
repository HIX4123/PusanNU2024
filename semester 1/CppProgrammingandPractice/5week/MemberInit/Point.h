class Point {
 public:
  // implements the constructor with member initializer list
  Point(double x = 0, double y = 0);
  double norm() const;
  double getX() const;
  double getY() const;

 private:
  const double x, y;
};