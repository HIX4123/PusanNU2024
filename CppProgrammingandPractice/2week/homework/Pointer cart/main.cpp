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
  int id;
  std::string name;
  int quantity;
  int price;
};

enum class Menu {
  AddNewItem = 1,
  RemoveItem,
  ViewItemDetails,
  ViewTotalCost,
  Exit
};

int main() {
  int item_count = 0;
  Item *cart = nullptr;

  while (true) {
    std::cout << "1. Add new item" << std::endl;
    std::cout << "2. Remove item" << std::endl;
    std::cout << "3. View item details" << std::endl;
    std::cout << "4. View total cost" << std::endl;
    std::cout << "5. Exit" << std::endl;
    std::cout << "Enter your choice: ";

    int choice;
    std::cin >> choice;

    switch (static_cast<Menu>(choice)) {
    case Menu::AddNewItem:
      cart = new Item[++item_count];
      cart[item_count - 1].id = item_count; // [1
      std::cout << "Enter Item name: " << std::endl;
      std::cin >> cart[item_count - 1].name;
      std::cout << "Enter Item quantity: " << std::endl;
      std::cin >> cart[item_count - 1].quantity;
      std::cout << "Enter Item price: " << std::endl;
      std::cin >> cart[item_count - 1].price;
      break;
    case Menu::RemoveItem:
      std::cout << "Enter item ID: ";
      int id;
      std::cin >> id;
      for (int i = 0; i < item_count; i++) {
        if (cart[i].id == id) {
          for (int j = i; j < item_count - 1; j++) {
            cart[j] = cart[j + 1];
          }
          item_count--;
          break;
        }
      }
      break;
    case Menu::ViewItemDetails:
      std::cout << "Enter the item number: ";
      int item_number;
      std::cin >> item_number;
      for (Item)
//      std::cout << "Item ID: " << cart[item_number - 1].id << std::endl;
//      std::cout << "Name: " << cart[item_number - 1].name << std::endl;
//      std::cout << "Quantity: " << cart[item_number - 1].quantity << std::endl;
//      std::cout << "Price: " << cart[item_number - 1].price << std::endl;
      break;
    case Menu::ViewTotalCost:
      break;
    case Menu::Exit:
      break;
    default:
      std::cout << "Invalid choice" << std::endl;
      break;
    }
  }
}