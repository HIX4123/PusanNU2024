#include <iostream>
#include <memory>
#include <string>
#include <vector>

class Car {
 protected:
  int speed_;

 public:
  Car() {}
  ~Car() {}

  virtual void accelerate() const = 0;
};

class GV70 : public Car {
 private:
  const std::string name_ = "gv70";

 public:
  GV70();
  ~GV70();

  void accelerate() const override;
};

GV70::GV70() { Car::speed_ = 30; }

GV70::~GV70() {}

void GV70::accelerate() const {
  std::cout << "The speed of the " << name_ << " has increased by "
            << Car::speed_ << " km/h." << std::endl;
}

class Grandeur : public Car {
 private:
  const std::string name_ = "grandeur";

 public:
  Grandeur();
  ~Grandeur();

  void accelerate() const override;
};

Grandeur::Grandeur() { Car::speed_ = 20; }

Grandeur::~Grandeur() {}

void Grandeur::accelerate() const {
  std::cout << "The speed of the " << name_ << " has increased by "
            << Car::speed_ << " km/h." << std::endl;
}

class Carnibal : public Car {
 private:
  const std::string name_ = "carnibal";

 public:
  Carnibal();
  ~Carnibal();

  void accelerate() const override;
};

Carnibal::Carnibal() { Car::speed_ = 10; }

Carnibal::~Carnibal() {}

void Carnibal::accelerate() const {
  std::cout << "The speed of the " << name_ << " has increased by "
            << Car::speed_ << " km/h." << std::endl;
}

std::unique_ptr<Car> make_vehicle() {
  std::string choice;
  std::cin >> choice;
  if (choice == "gv70")
    return std::make_unique<GV70>();
  else if (choice == "grandeur")
    return std::make_unique<Grandeur>();
  else if (choice == "carnibal")
    return std::make_unique<Carnibal>();
  return nullptr;
}

int main() {
  std::vector<std::unique_ptr<Car>> test_vehicles;
  test_vehicles.push_back(make_vehicle());
  test_vehicles.push_back(make_vehicle());
  test_vehicles.push_back(make_vehicle());
  for (auto& v : test_vehicles) (*v).accelerate();
}