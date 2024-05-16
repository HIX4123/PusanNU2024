#include <string>
#include <vector>

#include "Item.h"

enum DiscountCode { NO_DISCOUNT, DISCOUNT_20, DISCOUNT_50 };

class Checkout {
 public:
  Checkout(DiscountCode discountCode = NO_DISCOUNT)
      : discountCode(discountCode) {}

  int calculateTotalPrice(std::vector<Item>::const_iterator begin,
                          std::vector<Item>::const_iterator end) const;

  void setShippingAddress(const std::string &shippingAddress);
  void setDiscountCode(DiscountCode discountCode);

 private:
  std::string shippingAddress;
  DiscountCode discountCode;
};