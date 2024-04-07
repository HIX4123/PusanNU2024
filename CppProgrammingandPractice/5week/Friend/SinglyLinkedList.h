#include "Node.h"

#include <iostream>

class SinglyLinkedList {
  public:
  SinglyLinkedList() : head(nullptr) {}
  void addNode(Song data);
  void removeNode(Song data);
  void printList();

  private:
  Node* head;
};