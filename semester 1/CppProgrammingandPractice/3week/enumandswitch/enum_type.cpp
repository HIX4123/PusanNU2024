#include <iostream>

enum Color { RED, GREEN, BLUE };

int main() {
  int color;
  std::cin >> color;

  Color colorenum = static_cast<Color>(color);

  switch (colorenum) {
    case RED:
      std::cout << "It's red light!" << std::endl;
      break;
    case GREEN:
      std::cout << "It's green light!" << std::endl;
      break;
    case BLUE:
      std::cout << "It's blue light!" << std::endl;
      break;
    default:
      std::cout << "What's this?" << std::endl;
  }
}
