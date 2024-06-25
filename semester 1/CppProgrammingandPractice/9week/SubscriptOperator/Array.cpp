#include "Array.h"

Array::Array(const std::initializer_list<int> args, const size_t size)
    : data(new int[size]), _size(size) {
  int i = 0;
  for (auto it : args) {
    data[i++] = it;
  }
}

int& Array::operator[](const int index) { return data[index]; }

size_t Array::size() const { return _size; }