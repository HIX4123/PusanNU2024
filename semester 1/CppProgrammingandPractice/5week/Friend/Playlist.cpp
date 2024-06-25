#include "Playlist.h"

void Playlist::addSong(std::string name, std::string artist) {
  Song newSong(name, artist);
  songList->addNode(newSong);
}

void Playlist::removeSong(Song song) { songList->removeNode(song); }

void Playlist::printPlaylist() {
  std::cout << "Playlist:" << std::endl;
  songList->printList();
  std::cout << std::endl;
}