#include "Vehicle.h"

#include <iomanip>
#include <iostream>

// your code here
Vehicle::Vehicle()
    : name{"Model Y LR"}, range{511}, hasFDS{false}, batteryCapacity{85} {}

Vehicle::Vehicle(std::string name, int range, float batteryCapacity)
    : name{name}, range{range}, batteryCapacity{batteryCapacity} {}

Vehicle::Vehicle(std::string name, int range, bool hasFDS,
                 float batteryCapacity)
    : name{name},
      range{range},
      hasFDS{hasFDS},
      batteryCapacity{batteryCapacity} {}

void Vehicle::autoPilot(bool onOff) {
  std::cout << "Auto-Pilot is " << (onOff ? "on!" : "off!") << std::endl;
}

void Vehicle::runFDS() const {
  if (hasFDS) std::cout << "Full Self-Driving!" << std::endl;
}

void Vehicle::displayEfficiency() const {
  std::cout << name << " Range: " << range
            << "km, Efficiency: " << std::setprecision(3)
            << range / batteryCapacity << "kWh/100km" << std::endl;
}