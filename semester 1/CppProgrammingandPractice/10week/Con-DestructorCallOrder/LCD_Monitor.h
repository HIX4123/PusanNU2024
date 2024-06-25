#include "Monitor.h"

class LCD_Monitor : public Monitor {
 private:
  /* data */
 public:
  LCD_Monitor(/* args */);
  ~LCD_Monitor();
};

LCD_Monitor::LCD_Monitor(/* args */) {
  std::cout << "LCD_Monitor constructor" << std::endl;
}

LCD_Monitor::~LCD_Monitor() {
  std::cout << "LCD_Monitor destructor" << std::endl;
}
