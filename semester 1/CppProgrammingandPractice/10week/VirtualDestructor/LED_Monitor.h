#include "Monitor.h"

class LED_Monitor : public Monitor {
 private:
  /* data */
 public:
  LED_Monitor(/* args */);
  ~LED_Monitor();
};

LED_Monitor::LED_Monitor(/* args */) {
  std::cout << "LED_Monitor constructor" << std::endl;
}

LED_Monitor::~LED_Monitor() {
  std::cout << "LED_Monitor destructor" << std::endl;
}
