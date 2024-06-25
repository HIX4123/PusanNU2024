// implement your code
#include "Temperature.h"

#include <iomanip>
#include <sstream>

Temperature::Temperature(double temp, SCALE scale)
    : temperature(temp), scale(scale) {};

Temperature Temperature::add(Temperature other) {
  if (other.scale != this->scale) {
    if (this->scale == FAHRENHEIT) {
      other.convertToFahrenheit();
    } else {
      other.convertToCelsius();
    }
  }
  return Temperature(this->temperature + other.temperature, this->scale);
}

std::string Temperature::print() const {
  std::stringstream ss;
  ss << std::fixed;
  ss << std::setprecision(1);
  if (this->scale == FAHRENHEIT) {
    ss << this->temperature << " F\n";
  } else {
    ss << this->temperature << " C \n";
  }

  return ss.str();
}

void Temperature::convertToCelsius() {
  this->temperature = (this->temperature - 32) * 5 / 9;
  this->scale = CELSIUS;
}

void Temperature::convertToFahrenheit() {
  this->temperature = this->temperature * 9 / 5 + 32;
  this->scale = FAHRENHEIT;
}