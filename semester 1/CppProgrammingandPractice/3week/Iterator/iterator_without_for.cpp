#include <algorithm>  // Include the missing header file
#include <iostream>
#include <iterator>  // Include the missing header file
#include <vector>

int main() {
  std::vector<int> v;

  std::istream_iterator<int> cit(std::cin);
  std::istream_iterator<int> eos;

  std::copy(cit, eos, std::back_inserter(v));

  std::sort(
      v.begin(),
      v.end());  // Fix: Use v.begin() and v.end() as arguments for std::sort

  std::ostream_iterator<int> coit(std::cout, " ");

  std::copy(v.begin(), v.end(), coit);
}
