#include "SinglyLinkedList.h"

void SinglyLinkedList::addNode(Song data) {
  Node* newNode = new Node(data);
  newNode->next = head;
  head = newNode;
}

void SinglyLinkedList::removeNode(Song data) {
  Node* now = head;
  Node* next = head->next;

  if (head->data.equals(data)) {
    head = head->next;
    delete now;
    return;
  }

  while (next != nullptr) {
    if (next->data.equals(data)) {
      now->next = next->next;
      delete next;
      return;
    }
  }
}

void SinglyLinkedList::printList() {
  Node* now = head;
  while (now != nullptr) {
    std::cout << now->data.toString() << std::endl;
    now = now->next;
  }
}