#include <cassert>
#include <iostream>
#include <list>
#include <numeric>
#include <vector>

#include "my_accumulate.h"

int main() {
  std::vector<int> vec = {1, 2, 3, 4, 5};

  for (const auto& it : vec) std::cout << it << ' ';
  std::cout << '\n';
  std::cout << my_accumulate(vec.cbegin(), vec.cend(), 0) << std::endl;
  assert(my_accumulate(vec.cbegin(), vec.cend(), 0) ==
         accumulate(vec.cbegin(), vec.cend(), 0));

  std::list<int> numbers = {1, 2, 3, 4, 5};
  for (const auto& it : numbers) std::cout << it << ' ';
  std::cout << '\n';
  std::cout << my_accumulate(numbers.cbegin(), numbers.cend(), 0) << std::endl;
  assert(my_accumulate(numbers.cbegin(), numbers.cend(), 0) ==
         accumulate(numbers.cbegin(), numbers.cend(), 0));

  return 0;
}