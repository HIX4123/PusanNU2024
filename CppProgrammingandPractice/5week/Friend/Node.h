#include "Song.h"

class Node {
 public:
  Node(Song d) : data(d), next(nullptr) {}

  friend class SinglyLinkedList;

 private:
  Song data;
  Node* next;
};