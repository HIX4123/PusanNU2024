#include <string>

class Person {
 public:
  Person(std::string name, size_t age) : person_name{name}, age{age} {
    // set ID with uniqueness
    static long long id = 0;
    ID = ++id;
  }

  friend std::ostream &operator<<(std::ostream &out, const Person &p) {
    // implementation
    out << p.ID << " " << p.person_name << " " << p.age;
    return out;
  }

  bool operator<(const Person &rhs) const {
    // implementation
    return ID < rhs.ID;
  }

  class ComparatorByAge {
   public:
    bool operator()(const Person &lhs, const Person &rhs) const {
      // implementation
      return lhs.age < rhs.age;
    }
  };

  class ComparatorByName {
   public:
    // implementation
    bool operator()(const Person &lhs, const Person &rhs) const {
      return lhs.person_name.compare(rhs.person_name) < 0;
    }
  };

 private:
  long long ID;
  std::string person_name;
  size_t age;
};