#include "pointer.h"

void update(int* a, int* b) {
  int tempA = *a;
  int tempB = *b;

  *a = tempA + tempB;
  *b = tempA - tempB;
}