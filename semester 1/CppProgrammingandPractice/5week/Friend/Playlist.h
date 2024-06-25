#include "SinglyLinkedList.h"

class Playlist {
 public:
  Playlist() : songList(new SinglyLinkedList()) {}
  void addSong(std::string name, std::string artist);
  void removeSong(Song song);
  void printPlaylist();

 private:
  SinglyLinkedList* songList;
};