#include <algorithm>
#include <iostream>
#include <vector>

struct Number {
  int value;
  int count;
};

int main() {
  int length;
  std::cin >> length;

  std::vector<int> numbers(length);

  for (int i = 0; i < length; i++) {
    std::cin >> numbers[i];
  }

  int average = 0;
  for (int i = 0; i < length; i++) {
    average += numbers[i];
  }
  average /= length;
  std::cout << average << std::endl;

  int middle = numbers[0];
  std::sort(numbers.begin(), numbers.end());
  middle = numbers[(length - 1) / 2];
  std::cout << middle << std::endl;

  int mode = 0;
  int max_count = 0;
  std::vector<Number> number(length);
  for (int i = 0; i < length; i++) {
    int count = 0;
    for (int j = 0; j < length; j++) {
      if (numbers[i] == numbers[j]) {
        count++;
      }
    }
    if (count > max_count) {
      max_count = count;
      mode = numbers[i];
    }
  }
}