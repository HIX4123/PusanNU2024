#include <memory>

#include "EzrealSkill.h"
#include "GangplankSkill.h"

enum class CHAMPION { GANGPLANK, EZREAL };
class Champion {
 public:
  void select_champion(CHAMPION champion) {
    switch (champion) {
      case CHAMPION::GANGPLANK:
        skill = std::make_unique<GangplankSkill>();
        break;
      case CHAMPION::EZREAL:
        skill = std::make_unique<EzrealSkill>();
    }
  }
  void q() { skill->q(); }
  void w() { skill->w(); }
  void e() { skill->e(); }
  void r() { skill->r(); }

 private:
  std::unique_ptr<Skill> skill;
};