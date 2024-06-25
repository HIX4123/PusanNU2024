#include "Playlist.h"

int main() {
  Playlist myPlaylist;

  myPlaylist.addSong("Shape of You", "Ed Sheeran");
  myPlaylist.addSong("Uptown Funk", "Mark Ronson ft. Bruno Mars");
  myPlaylist.addSong("Blank Space", "Taylor Swift");
  myPlaylist.addSong("Thinking Out Loud", "Ed Sheeran");

  myPlaylist.printPlaylist();

  Song removedSong("Blank Space", "Taylor Swift");
  myPlaylist.removeSong(removedSong);
  removedSong = {"Uptown Funk", "Mark Ronson ft. Bruno Mars"};
  myPlaylist.removeSong(removedSong);

  myPlaylist.printPlaylist();

  return 0;
}
