#include <string>

enum CELL_TYPE { STRING, INT, DOUBLE };

class Cell {
 public:
  Cell();
  Cell(std::string val);
  Cell(int val);
  Cell(double val);

  CELL_TYPE getType() const;
  std::string getStringVal() const;
  int getIntVal() const;
  double getDoubleVal() const;

 private:
  CELL_TYPE type;
  std::string stringVal;
  int intVal;
  double doubleVal;
};