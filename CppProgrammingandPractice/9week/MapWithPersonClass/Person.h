#include <string>

class Person {
 public:
  Person(std::string name, size_t age) : name{name}, age{age} {
    // set ID with uniqueness
  }

  friend std::ostream& operator<<(std::ostream& out, const Person& p) {
    // implementation
  }

  bool operator<(const Person& rhs) const {
    // implementation
  }

  class ComparatorByAge {
   public:
    bool operator()(const Person& lhs, const Person& rhs) const {
      // implementation
    }
  };

  class ComparatorByName {
   public:
    // implementation
  };

 private:
  long long ID;
  std::string name;
  size_t age;
};