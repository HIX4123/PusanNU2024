#include <vector>

#include "Cell.h"

class Excel {
 public:
  Excel(std::vector<std::vector<Cell>> data);
  double average(int fromRoe, int fromCol, int toRow, int toCol) const;

 private:
  std::vector<std::vector<Cell>> data;
};