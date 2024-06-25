#include "Checkout.h"

using const_iterator = std::vector<Item>::const_iterator;

/**
 * @class Cart
 * @brief Represents a shopping cart that holds items for checkout.
 *
 * The Cart class provides functionality to add and delete items, perform checkout,
 * and view item details. It also supports iteration over the items in the cart.
 */
class Cart {
 public:
  Cart(Checkout* checkout) : checkout_(checkout) {}

  void addItem(const Item& item);
  void deleteItem(int id);
  int checkout();
  void viewItemDetails(int id, std::ostream& out) const;

  const_iterator cbegin() const;
  const_iterator cend() const;

 private:
  Checkout* checkout_;
  std::vector<Item> items;
};