#include <string>

class Vehicle {
 public:
  // your code here
  Vehicle();
  Vehicle(std::string name, int range, float batteryCapacity);
  Vehicle(std::string name, int range, bool hasFDS, float batteryCapacity);
  void autoPilot(bool onOff);
  void runFDS() const;
  void displayEfficiency() const;

 private:
  std::string name;
  int range;
  bool hasFDS;
  float batteryCapacity;
};