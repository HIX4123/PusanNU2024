#include <algorithm>
#include <cmath>
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

  float average = 0;
  for (int i = 0; i < length; i++) {
    average += numbers[i];
  }
  average = round(average / length);
  std::cout << average << std::endl;

  int middle = numbers[0];
  std::sort(numbers.begin(), numbers.end());
  middle = numbers[(length - 1) / 2];
  std::cout << middle << std::endl;

  int mode = 0;
  std::vector<Number> counts;
  for (int i : numbers) {
    bool found = false;
    for (Number j : counts) {
      if (j.value == i) {
        j.count++;
        found = true;
      }
    }
    if (!found) {
      Number number;
      number.value = i;
      number.count = 1;
      counts.emplace_back(number);
    }
    for (Number i : counts) {
      std::cout << i.value << ":" << i.count << " ";
    }
    std::cout << std::endl;
  }
  std::sort(counts.begin(), counts.end(), [](Number a, Number b) {
    if (a.count == b.count) {
      return a.value < b.value;
    }
    return a.count > b.count;
  });
  if (counts[0].count == counts[1].count) {
    mode = counts[1].value;
  } else {
    mode = counts[0].value;
  }
  std::cout << mode << std::endl;

  int range = numbers[length - 1] - numbers[0];
  std::cout << range << std::endl;
}