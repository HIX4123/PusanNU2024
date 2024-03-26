#include <iostream>

int main() {
  int x, y;
  std::cin >> x >> y;
  int** numbers = new int*[x];
  for (int i = 0; i < x; i++) {
    numbers[i] = new int[y];
  }

  for (int i = 0; i < x; i++) {
    for (int j = 0; j < y; j++) {
      std::cin >> numbers[i][j];
    }
  }

  for (int i = 0; i < x; i++) {
    int sum = 0;
    for (int j = 0; j < y; j++) {
      sum += numbers[i][j];
    }
    std::cout << sum << " ";
  }

  std::cout << std::endl;

  for (int j = 0; j < y; j++) {
    int sum = 0;
    for (int i = 0; i < x; i++) {
      sum += numbers[i][j];
    }
    std::cout << sum << " ";
  }

  for (int i = 0; i < x; i++) {
    delete[] numbers[i];
  }
  delete[] numbers;
  std::cout << std::endl;
}