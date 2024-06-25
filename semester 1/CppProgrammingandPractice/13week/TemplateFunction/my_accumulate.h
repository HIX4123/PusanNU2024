// my_accumulate.h

template <typename T, typename U>
U my_accumulate(T _begin, T _end, U init) {
  U sum = init;
  for (auto i = _begin; i != _end; ++i) {
    sum += *i;
  }
  return sum;
}
