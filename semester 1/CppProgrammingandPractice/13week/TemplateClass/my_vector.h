#ifndef TEMPLATE_MY_VECTOR_H
#define TEMPLATE_MY_VECTOR_H

#include <algorithm>
#include <initializer_list>
#include <memory>

template <typename T>
class my_vector {
 public:
  explicit my_vector(size_t N = 0) noexcept : _size(N), _data(new T[N]) {}

  my_vector(std::initializer_list<int> lst) noexcept
      : _size(lst.size()), _data(new T[_size]) {
    size_t i = 0;
    for (auto value : lst) {
      _data[i++] = value;
    }
  }

  my_vector(const my_vector<T>& other) noexcept
      : _size(other._size), _data(new T[_size]) {
    for (size_t i = 0; i < _size; i++) {
      _data[i] = other._data[i];
    }
  }

  T& operator[](size_t i) { return _data[i]; }

  size_t size() const { return _size; }

 private:
  size_t _size;
  std::unique_ptr<T[]> _data;
};

#endif  // TEMPLATE_MY_VECTOR_H