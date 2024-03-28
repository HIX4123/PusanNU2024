// 벡터 받아서 인덱스 삭제랑 값삭제 구현

#include <iostream>
#include <vector>

int main() {
  int length;
  std::cin >> length;

  std::vector<int> vec(length);
  for (int i = 0; i < length; i++) {
    std::cin >> vec[i];
  }

  int index;
  std::cin >> index;
  vec.erase(vec.begin() + index);

  int value;
  std::cin >> value;
  for (int i = 0; i < vec.size(); i++) {
    if (vec[i] == value) {
      vec.erase(vec.begin() + i);
      break;
    }
  }
}