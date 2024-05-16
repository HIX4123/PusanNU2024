#include <iostream>

#include "Cart.h"

int main() {
  Checkout checkout;
  Cart cart{&checkout};

  while (true) {
    std::cout << "1. Add item" << std::endl;
    std::cout << "2. Delete item" << std::endl;
    std::cout << "3. View item details" << std::endl;
    std::cout << "4. View total cost" << std::endl;
    std::cout << "5. Quit" << std::endl;
    std::cout << "Enter your choice: ";

    int choice;
    std::cin >> choice;

    if (choice == 5) {
      break;
    }

    switch (choice) {
      case 1: {
        std::cout << "Enter item name: ";
        std::string name;
        std::cin >> name;

        std::cout << "Enter item quantity: ";
        int quantity;
        std::cin >> quantity;

        std::cout << "Enter item price: ";
        int price;
        std::cin >> price;

        Item item(name, quantity, price);
        cart.addItem(item);

        std::cout << "\tItem " << item.getId() << " added successfully."
                  << std::endl;
        break;
      }
      case 2: {
        std::cout << "Enter item ID: ";
        int id;
        std::cin >> id;
        cart.deleteItem(id);
        std::cout << "\tItem deleted successfully." << std::endl;
        break;
      }
      case 3: {
        std::cout << "Enter the item number: ";
        int id;
        std::cin >> id;
        cart.viewItemDetails(id, std::cout);
        break;
      }
      case 4: {
        int totalPrice = cart.checkout();
        std::cout << "Total cost: " << totalPrice << std::endl;
        break;
      }
      default: {
        break;
      }
    }
  }
  return 0;
}