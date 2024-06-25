#include <initializer_list>
#include <iostream>
#include <map>
#include <string>
#include <utility>
using namespace std;

class Phonebook {
  map<string, int> contacts;

 public:
  Phonebook(initializer_list<pair<string, int>> lst) {
    // 생성자를 구현하세요!
    for (auto& p : lst) {
      contacts.insert(p);
    }
  }
  void print() const {
    // 멤버 함수를 구현하세요!
    for (auto& p : contacts) {
      cout << p.first << " " << p.second << endl;
    }
  }
};

int main() {
  Phonebook p = {{"Kim", 24}, {"Lee", 21}};
  p.print();
  return 0;
}