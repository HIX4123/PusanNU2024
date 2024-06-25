#include "OutputDevice.h"

class Printer : public OutputDevice {
 private:
  /* data */
 public:
  Printer(/* args */);
  ~Printer();
};

Printer::Printer(/* args */) {
  std::cout << "Printer constructor" << std::endl;
}

Printer::~Printer() { std::cout << "Printer destructor" << std::endl; }
