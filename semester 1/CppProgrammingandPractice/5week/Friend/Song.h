#include <string>

class Song {
 public:
  std::string name;
  std::string artist;

  Song(std::string n, std::string a) : name(n), artist(a) {}

  bool equals(Song other) {
    return name == other.name && artist == other.artist;
  }

  std::string toString() { return name + " by " + artist; }
};