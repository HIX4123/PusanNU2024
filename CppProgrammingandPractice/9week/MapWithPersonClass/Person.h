#include <string>

class Person
{
public:
  Person(std::string name, size_t age) : name{name}, age{age}
  {
    // set ID with uniqueness
    static long long id = 0;
    ID = ++id;
  }

<<<<<<< HEAD
  friend std::ostream &operator<<(std::ostream &out, const Person &p) {
=======
  friend std::ostream &operator<<(std::ostream &out, const Person &p)
  {
>>>>>>> adb54fc4d88d5b2dafbb32c50d812b038e647821
    // implementation
    out << p.ID << " " << p.name << " " << p.age;
    return out;
  }

<<<<<<< HEAD
  bool operator<(const Person &rhs) const {
=======
  bool operator<(const Person &rhs) const
  {
>>>>>>> adb54fc4d88d5b2dafbb32c50d812b038e647821
    // implementation
    return ID < rhs.ID;
  }

<<<<<<< HEAD
  class ComparatorByAge {
   public:
    bool operator()(const Person &lhs, const Person &rhs) const {
=======
  class ComparatorByAge
  {
  public:
    bool operator()(const Person &lhs, const Person &rhs) const
    {
>>>>>>> adb54fc4d88d5b2dafbb32c50d812b038e647821
      // implementation
      return lhs.age < rhs.age;
    }
  };

  class ComparatorByName
  {
  public:
    // implementation
    bool operator()(const Person &lhs, const Person &rhs) const {
      return lhs.name.compare(rhs.name) < 0;
    }
  };

private:
  long long ID;
  std::string name;
  size_t age;
};