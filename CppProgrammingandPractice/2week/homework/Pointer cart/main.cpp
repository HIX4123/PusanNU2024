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

#include <iostream>
#include <vector>

struct Item {
  int id{};
  std::string name;
  int quantity{};
  int price{};

  Item(int id) : id(id) {}
};

enum class Menu { ADD = 1, DELETE, VIEW, TOTAL, QUIT };

int main() {
  std::vector<Item *> cart;
  int response = static_cast<int>(Menu::ADD);
  int total;

  while (true) {

    std::cout << "1. Add item\n2. Delete item\n3. View item details\n4. View "
                 "total cost\n5. Quit\nEnter your choice: ";
    std::cin >> response;

    switch (static_cast<Menu>(response)) {
    case Menu::ADD:
      cart.push_back(new Item(static_cast<int>(cart.size())));
      std::cout << "Enter item name: ";
      std::cin >> cart.back()->name;
      std::cout << "Enter item quantity: ";
      std::cin >> cart.back()->quantity;
      std::cout << "Enter item price: ";
      std::cin >> cart.back()->price;
      std::cout << "Item " << cart.size() - 1 << " added successfully.\n";
      break;

    case Menu::DELETE:
      std::cout << "Enter item ID: ";
      std::cin >> response;
      if (response < cart.size()) {
        cart.erase(cart.begin() + response);
        std::cout << "Item deleted successfully.\n";
      }
      break;

    case Menu::VIEW:
      std::cout << "Enter the item number: ";
      std::cin >> response;
      if (response < cart.size()) {
        std::cout << "Item " << response << ": \nName: " << cart[response]->name
                  << "\nQuantity: " << cart[response]->quantity
                  << "\nPrice: " << cart[response]->price << std::endl;
      } else {
        std::cout << "Item not found\n";
      }
      break;

    case Menu::TOTAL:
      total = 0;
      for (const auto &item : cart) {
        total += item->price * item->quantity;
      }
      std::cout << "Total cost: " << total << std::endl;
      break;

    case Menu::QUIT:
      for (auto &item : cart) {
        delete item;
      }
      return 0;

    default:
      std::cerr << "Invalid choice. Please try again.\n";
    }
  }
}