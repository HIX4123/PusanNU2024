#include "static.h"

void inc(std::promise<int>&& result) {
  static int COUNTER = 100000;
  result.set_value(COUNTER);
}

int getCounter() {
  static int COUNTER = 1;
  return COUNTER++;
}