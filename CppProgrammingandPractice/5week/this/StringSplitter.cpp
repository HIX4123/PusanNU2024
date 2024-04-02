#include <string>
#include <vector>

class StringSplitter {
 private:
  static std::vector<std::string> tokens;
  std::string str;

 public:
  StringSplitter(std::string input) : str(input) {}

  StringSplitter& trim() {
    while (str.size() && isspace(str.front())) {
      str.erase(str.begin());
    }
    while (str.size() && isspace(str.back())) {
      str.pop_back();
    }

    return *this;
  }

  StringSplitter& removeNonAlnum() {
    for (char& spell : str) {
      if (!isalnum(spell)) {
        spell = ' ';
      }
    }

    return *this;
  }

  // StringSplitter& split(char delimiter) {
  std::vector<std::string> split(char delimiter) {
    std::string token;

    for (char& spell : str) {
      if (spell == delimiter) {
        if (token.size()) {
          tokens.push_back(token);
          token.clear();
        }
      } else {
        token.push_back(spell);
      }
    }

    return tokens;
  }
};
