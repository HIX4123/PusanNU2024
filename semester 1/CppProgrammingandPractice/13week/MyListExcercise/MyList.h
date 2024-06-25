#include <algorithm>
#include <complex>
#include <cstddef>
#include <iostream>
#include <vector>

template <typename T, size_t N>
class MyList {
 public:
  MyList();
  MyList(const MyList& rhs) noexcept;
  MyList& operator=(const MyList& rhs);
  ~MyList() noexcept;

  void add(const T& data);
  void remove(const T& data);

  const T* begin() const { return _data; }
  const T* end() const { return _data + N; }

  T* begin() { return _data; }
  T* end() { return _data + N; }

 private:
  T* _data = nullptr;
  size_t pos = 0;
};

template <typename T, size_t N>
MyList<T, N>::MyList() : _data(new T[N]) {}

template <typename T, size_t N>
MyList<T, N>::MyList(const MyList& rhs) noexcept
    : _data(new T[N]), pos(rhs.pos) {
  std::copy(rhs._data, rhs._data + pos, _data);
}

template <typename T, size_t N>
MyList<T, N>& MyList<T, N>::operator=(const MyList<T, N>& rhs) {
  if (this != &rhs) {
    delete[] _data;
    _data = new T[N];
    pos = rhs.pos;
    std::copy(rhs._data, rhs._data + pos, _data);
  }
  return *this;
}

template <typename T, size_t N>
MyList<T, N>::~MyList() noexcept {
  delete[] _data;
}

template <typename T, size_t N>
void MyList<T, N>::add(const T& data) {
  if (pos < N) {
    _data[pos++] = data;
  } else {
    std::cout << "목록이 꽉 찼습니다. 요소를 더 추가할 수 없습니다."
              << std::endl;
  }
}

template <typename T, size_t N>
void MyList<T, N>::remove(const T& data) {
  for (size_t i = 0; i < pos; i++) {
    if (_data[i] == data) {
      std::copy(_data + i + 1, _data + pos, _data + i);
      _data[--pos] = T();
      break;
    }
  }
}