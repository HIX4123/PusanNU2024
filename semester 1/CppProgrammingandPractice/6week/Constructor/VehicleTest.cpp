#include "Vehicle.h"

int main() {
  Vehicle modelY{"Model Y LR", 511, 85};
  auto model3 = Vehicle{"Model 3 LR", 523, 85};

  modelY.displayEfficiency();
  model3.displayEfficiency();

  Vehicle vehicles[4] = {{"Model Y LR", 511, false, 85},
                         {"Model 3 LR", 523, true, 85},
                         {"Model Y LR", 511, false, 85},
                         {"Model 3 LR", 523, true, 85}};

  for (auto& v : vehicles) {
    v.autoPilot(false);
    v.runFDS();
    v.displayEfficiency();
  }

  Vehicle tesla[2];
  for (auto& t : tesla) {
    t.autoPilot(false);
    t.runFDS();
    t.displayEfficiency();
  }

  return 0;
}