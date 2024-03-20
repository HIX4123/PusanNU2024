#include <iostream>

enum Choice { ROCK, PAPER, SCISSORS };

int main() {
  int response;
  std::cin >> response;
  Choice choice = static_cast<Choice>(response);
  Choice computer_choice = static_cast<Choice>(rand() % 3);

  std::cout << "You chose: "
            << (choice == ROCK    ? "rock"
                : choice == PAPER ? "paper"
                                  : "scissors")
            << ".\nThe computer chose: "
            << (computer_choice == ROCK    ? "rock."
                : computer_choice == PAPER ? "paper."
                                           : "scissors.")
            << std::endl;

  switch (choice - computer_choice) {
    case 1:
    case -2:
      std::cout << "You won!" << std::endl;
      break;
    case 0:
      std::cout << "You tied!" << std::endl;
      break;
    case -1:
    case 2:
      std::cout << "The computer won!" << std::endl;
      break;

    default:
      break;
  }
}