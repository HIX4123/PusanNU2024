#include "Cell.h"

Cell::Cell() {}
Cell::Cell(std::string val) : type(STRING), stringVal(val) {}
Cell::Cell(int val) : type(INT), intVal(val) {}
Cell::Cell(double val) : type(DOUBLE), doubleVal(val) {}

CELL_TYPE Cell::getType() const { return type; }
std::string Cell::getStringVal() const { return stringVal; }
int Cell::getIntVal() const { return intVal; }
double Cell::getDoubleVal() const { return doubleVal; }