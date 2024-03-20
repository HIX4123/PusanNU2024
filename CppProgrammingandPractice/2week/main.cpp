#include <iostream>

int main() {
  int num;
  std::cin >> num;
  int* arr = new int(num);

  for (int i = 0; i < num; i++) {
    std::cin >> arr[i];
  }

  int index;
  std::cin >> index;
  std::cout << arr[arr[index]] << std::endl;

  delete[] arr;
}