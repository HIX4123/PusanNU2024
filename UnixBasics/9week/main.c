#include <stdio.h>

int mydivide(int, int);

int main() {
  int x = 5, y = 2;
  printf("%d\n", mydivide(x, y));

  x = 3;
  y = 0;
  printf("%d\n", mydivide(x, y));

  return 0;
}

int mydivide(int a, int b) { return a / b; }