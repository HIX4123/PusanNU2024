#ifndef TEMPLATE_MY_VECTOR_ITERATOR_H
#define TEMPLATE_MY_VECTOR_ITERATOR_H

template <typename T>
class my_vector;

template <typename T>
class my_vector_iterator {
 public:
  my_vector_iterator(T* e = nullptr);  // 기본 생성자
  T& operator*() { return *_e; }

  my_vector_iterator<T>& operator++() {
    _e++;
    return *this;
  }

  bool operator==(const my_vector_iterator<T>& e) const { return _e == e._e; }

  bool operator!=(const my_vector_iterator<T>& e) const {
    return !this->operator==(e);
  }

 private:
  T* _e = nullptr;  // my_vector 의 원소를 가리킴
};

template <typename T>
my_vector_iterator<T>::my_vector_iterator(T* e) : _e(e) {}

#endif  // TEMPLATE_MY_VECTOR_ITERATOR_H
