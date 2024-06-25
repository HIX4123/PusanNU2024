#include "StringSplitter.h"

#include <string>
#include <vector>

StringSplitter::StringSplitter(std::string input) : str(input) {}

StringSplitter& StringSplitter::trim() {
  while (str.size() && isspace(str.front())) {
    str.erase(str.begin());
  }
  while (str.size() && isspace(str.back())) {
    str.pop_back();
  }

  return *this;
}

StringSplitter& StringSplitter::removeNonAlnum() {
  for (char& spell : str) {
    if (!isalnum(spell)) {
      spell = ' ';
    }
  }

  return *this;
}

std::vector<std::string> StringSplitter::split(char delimiter) {
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

  if (token.size()) {
    tokens.push_back(token);
  }

  return tokens;
}