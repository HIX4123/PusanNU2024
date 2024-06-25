#include <iostream>
/*
 * 결제 시스템 업그레이드를 진행 중인 오마존에서 근무하고 있습니다.
 * 여러분의 임무는 구매되는 품목을 추적하는 프로그램을 작성하는 것입니다.
 *
 * 항목 배열을 생성하고 사용자가 다음 작업을 수행할 수 있도록 하는 프로그램을
 * 작성합니다: 카트에 새 품목 추가 카트에서 품목 삭제 특정 품목의 세부 정보 보기
 * 모든 품목의 총 비용 보기
 *
 * <제약사항>
 * cart 에 담을 수 있는 item 의 수는 제한이 없습니다.
 * item 은 다음 구조체 형식을 사용하십시오.
 * struct Item {
 *     int id;
 *     std::string name;
 *     int quantity;
 *     int price;
 * };
 * Item 생성 시 new/delete 를 이용한 동적 메모리 할당 방법을 정확하게 사용하여
 * 메모리 누수가 발생하지 않도록 주의하십시오. std::vector 와 std::unique_ptr
 * 방식도 허용합니다.
 */

struct Item {
  int id{};
  std::string name;
  int quantity{};
  int price{};
};

enum class Menu {
  AddNewItem = 1,
  RemoveItem,
  ViewItemDetails,
  ViewTotalCost,
  Exit
};

Item *cart = nullptr;

void printMenu() {
  std::cout << "1. Add item" << std::endl;
  std::cout << "2. Delete item" << std::endl;
  std::cout << "3. View item details" << std::endl;
  std::cout << "4. View total cost" << std::endl;
  std::cout << "5. Quit" << std::endl;
  std::cout << "Enter your choice: ";
}

Item *addNewItem(Item *cart, int &item_count) {
  Item *new_cart = new Item[item_count + 1];
  for (int i = 0; i < item_count; i++) {
    new_cart[i] = cart[i];
  }
  delete[] cart;
  cart = new_cart;

  cart[item_count].id = item_count;
  std::cout << "Enter item name: ";
  std::cin >> cart[item_count].name;
  std::cout << "Enter item quantity: ";
  std::cin >> cart[item_count].quantity;
  std::cout << "Enter item price: ";
  std::cin >> cart[item_count].price;

  std::cout << "Item " << item_count << "added successfully." << std::endl;

  item_count++;
  return cart;
}

Item *removeItem(Item *cart, int &item_count) {
  std::cout << "Enter item ID: ";
  int id;
  std::cin >> id;
  for (int i = 0; i < item_count; i++) {
    if (cart[i].id == id) {
      cart[i].id = -1;
      std::cout << "Item deleted successfully" << std::endl;
      return cart;
    }
  }
  std::cout << "Item not found" << std::endl;
  return cart;
}

void printItemDetails(Item *cart, int item_count) {
  std::cout << "Enter the item number: ";
  int item_number;
  std::cin >> item_number;
  for (int i = 0; i <= item_number; i++) {
    if (cart[i].id == item_number) {
      std::cout << "Item " << cart[i].id << " " << std::endl;
      std::cout << "Name: " << cart[i].name << std::endl;
      std::cout << "Quantity: " << cart[i].quantity << std::endl;
      std::cout << "Price: " << cart[i].price << std::endl;
      return;
    }
  }
  std::cout << "Item not found" << std::endl;
}

int getTotalCost(Item *cart, int item_count) {
  int total_cost = 0;
  for (int i = 0; i < item_count; i++) {
    if (cart[i].id == -1) {
      continue;
    }
    total_cost += cart[i].price * cart[i].quantity;
  }
  return total_cost;
}

int main() {
  int item_count = 0;

  int tmp;
  std::cin >> tmp;
  cart = addNewItem(cart, item_count);

  while (true) {
    printMenu();

    int choice;
    std::cin >> choice;

    switch (static_cast<Menu>(choice)) {
    case Menu::AddNewItem:
      cart = addNewItem(cart, item_count);
      break;
    case Menu::RemoveItem:
      cart = removeItem(cart, item_count);
      break;
    case Menu::ViewItemDetails:
      printItemDetails(cart, item_count);
      break;
    case Menu::ViewTotalCost:
      std::cout << "Total cost: " << getTotalCost(cart, item_count)
                << std::endl;
      break;
    case Menu::Exit:
      delete[] cart;
      return 0;
    default:
      std::cout << "Invalid tmp" << std::endl;
      break;
    }
  }
}