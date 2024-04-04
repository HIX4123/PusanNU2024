#include <string>
#include <vector>

class StringSplitter {
 private:
  std::vector<std::string> tokens;
  std::string str;

 public:
  StringSplitter(std::string input);

  StringSplitter& trim();
  StringSplitter& removeNonAlnum();
  std::vector<std::string> split(char delimiter);

};