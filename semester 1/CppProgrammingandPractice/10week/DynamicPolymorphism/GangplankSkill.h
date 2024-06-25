#include "Skill.h"
#include <iostream>

class GangplankSkill : public Skill {
 public:
 GangplankSkill() {}

void q() override {
  std::cout << "TRIAL BY FIRE (불의 심판)" << std::endl;
}

void w() override {
  std::cout << "PARRRLEY (혀어어어업상)" << std::endl;
}

void e() override {
  std::cout << "REMOVE SCURVY (괴혈병 치료)" << std::endl;
}

void r() override {
  std::cout << "POWDER KEG (화약통)" << std::endl;
}
};