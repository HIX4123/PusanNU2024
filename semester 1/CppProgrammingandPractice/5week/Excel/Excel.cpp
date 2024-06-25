#include "Excel.h"

Excel::Excel(std::vector<std::vector<Cell>> data) : data(data) {}

double Excel::average(int fromRow, int fromCol, int toRow, int toCol) const {
  double sum = 0;
  int count = (toRow - fromRow + 1) * (toCol - fromCol + 1);
  for (int i = fromRow; i <= toRow; i++) {
    for (int j = fromCol; j <= toCol; j++) {
      switch(data[i][j].getType()) {
        case STRING:
          count--;
          break;
        case INT:
          sum += data[i][j].getIntVal();
          break;
        case DOUBLE:
          sum += data[i][j].getDoubleVal();
          break;
      }
    }
  }
  return sum / count;
}