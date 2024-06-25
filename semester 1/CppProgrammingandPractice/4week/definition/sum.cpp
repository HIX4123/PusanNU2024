#include <vector>


extern std::vector<int> vec;
extern int total;

void sum() {
  for (int i : vec) {
    total += i;
  }
}