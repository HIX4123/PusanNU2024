#include "OutputDevice.h"

#ifndef MONITOR
#define MONITOR

class Monitor : public OutputDevice {
 private:
  /* data */
 public:
  Monitor(/* args */);
  ~Monitor();
};

Monitor::Monitor(/* args */) {
  std::cout << "Monitor constructor" << std::endl;
}

Monitor::~Monitor() { std::cout << "Monitor destructor" << std::endl; }

#endif