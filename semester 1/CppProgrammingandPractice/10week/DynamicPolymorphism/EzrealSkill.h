#include <iostream>

#include "Skill.h"

class EzrealSkill : public Skill {
 public:
  void q() override {
    std::cout << "RISING SPELL FORCE (끓어오르는 주문의 힘)" << std::endl;
  }

  void w() override { std::cout << "MYSTIC SHOT (신비한 화살)" << std::endl; }

  void e() override { std::cout << "ESSENCE FLUX (정수의 흐름)" << std::endl; }

  void r() override { std::cout << "ARCANE SHIFT (비전 이동)" << std::endl; }
};