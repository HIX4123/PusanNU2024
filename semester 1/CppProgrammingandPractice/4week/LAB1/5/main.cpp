// 벡터 받아서 인덱스 삭제랑 값삭제 구현

#include <algorithm>
#include <iostream>
#include <vector>

int main() {
  int length;
  std::cin >> length;

  std::vector<int> v(length);
  for (int i = 0; i < length; i++) {
    std::cin >> v[i];
  }

  int index;
  std::cin >> index;
  v.erase(v.begin() + index);

  int value;
  std::cin >> value;
  v.erase(std::remove(v.begin(), v.end(), value), v.end());

  std::cout << v.size() << std::endl;
  for (int &i : v) {
    std::cout << i << " ";
  }
  std::cout << std::endl;
}