#include <iostream>

#ifndef OUTPUTDEVICE
#define OUTPUTDEVICE

class OutputDevice {
 private:
  /* data */
 public:
  OutputDevice(/* args */);
  virtual ~OutputDevice();
};

OutputDevice::OutputDevice(/* args */) {
  std::cout << "OutputDevice constructor" << std::endl;
}

OutputDevice::~OutputDevice() {
  std::cout << "OutputDevice destructor" << std::endl;
}

#endif