#ifndef TEMPLATE_MY_VECTOR_H
#define TEMPLATE_MY_VECTOR_H

#include <algorithm>
#include <cstddef>
#include <initializer_list>
#include <memory>

#include "my_vector_iterator.h"

template <typename T>
class my_vector {
 public:
  // 실습 8-2 에서 정의한 my_vector의 멤버 함수들
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

  // 추가 함수들 - begin(), end()
  my_vector_iterator<T> begin() { return my_vector_iterator<T>(_data.get()); }

  my_vector_iterator<T> end() {
    return my_vector_iterator<T>(_data.get() + _size);
  }

 private:
  size_t _size;
  std::unique_ptr<T[]> _data;
};

#endif  // TEMPLATE_MY_VECTOR_H