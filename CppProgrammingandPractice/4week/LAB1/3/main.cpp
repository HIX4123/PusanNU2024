// 행렬 2개 받아서 더하기
// 벡터 못씀
// LAB3

#include <iostream>
#include <vector>

int main() {
  int hor, vert;
  std::cin >> hor >> vert;

  std::vector<std::vector<int>> matrix(hor, std::vector<int>(vert));

  for (int i = 0; i < hor; i++) {
    for (int j = 0; j < vert; j++) {
      std::cin >> matrix[i][j];
    }
  }

  for (int i = 0; i < hor; i++) {
    for (int j = 0; j < vert; j++) {
      int temp;
      std::cin >> temp;
      matrix[i][j] += temp;
    }
  }

  for (int i = 0; i < hor; i++) {
    for (int j = 0; j < vert; j++) {
      std::cout << matrix[i][j] << ' ';
    }
    std::cout << std::endl;
  }

  return 0;
}