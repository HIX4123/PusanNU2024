class Matrix {
 public:
  // 생성자, 복사생성자
  Matrix(std::initializer_list<std::initializer_list<int>> dat)
      : row(dat.size()), col(dat.begin()->size()), data(new int[row * col]) {
    size_t i = 0;
    for (auto row : dat) {
      size_t j = 0;
      for (auto column : row) {
        data[i * col + j] = column;
        j++;
      }
      i++;
    }
  }

  Matrix& operator=(const Matrix& m) {
    row = m.row;
    col = m.col;
    delete[] data;
    data = new int[row * col];
    for (size_t i = 0; i < row * col; i++) {
      data[i] = m.data[i];
    }
    return *this;
  }
  // 연산자 오버로딩
  // 멤버 함수들
 private:
  size_t row = 0;
  size_t col = 0;
  int* data = nullptr;
};