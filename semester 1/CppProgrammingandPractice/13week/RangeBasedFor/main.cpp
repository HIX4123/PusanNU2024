#include <iostream>
#include <numeric>

#include "my_vector.h"

int main() {
  using namespace std;
  my_vector<int> vec = {1, 2, 3, 4, 5};
  my_vector<int> vec2(vec);
  *(++vec2.begin()) = 50;

  for (const auto& it : vec2) cout << it << ' ';
  cout << '\n';

  cout << accumulate(vec2.begin(), vec2.end(), 0) << '\n';
  return 0;
}