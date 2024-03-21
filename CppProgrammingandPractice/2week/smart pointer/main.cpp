#include <iostream>
#include <memory>
using namespace std;

void update(int* a, int* b);
int main() {
  int a, b;
  std::cin >> a >> b;
  unique_ptr<int> pA(new int(a));
  unique_ptr<int> pB(new int(b));
  update(pA.get(), pB.get());
  cout << *pA << endl << *pB << endl;
}

void update(int* a, int* b) {
  int sum = *a + *b;
  int diff = *a - *b;
  *a = sum;
  *b = diff;
}