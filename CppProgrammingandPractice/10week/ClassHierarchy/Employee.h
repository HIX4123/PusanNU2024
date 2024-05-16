#include <iostream>
using namespace std;

class Employee {
 public:
  Employee(string name, int salary) : name_(name), salary_(salary) {}
  virtual void print_report() const {
    cout << "Name: " << name_ << endl;
    cout << "Salary: " << salary_ << endl;
    cout << "Years of service: " << years_of_service_ << endl;
    cout << "Performance score: " << performance_score_ << endl;
  }
  string get_name() const { return name_; }

 protected:
  string name_;
  int salary_;
  int years_of_service_ = 0;
  int performance_score_ = 0;
};

class Manager : public Employee {
 private:
  string department_;

 public:
  Manager(const string name, const int salary, const string department);
  ~Manager();

  void print_report() const override;

  void set_goals() const;
};

Manager::Manager(const string name, const int salary, const string department)
    : Employee{name, salary}, department_(department) {
  Employee::performance_score_ = 0;
}

Manager::~Manager() {}

void Manager::print_report() const {
  Employee::print_report();
  cout << "Department: " << department_ << endl;
}

void Manager::set_goals() const {
  cout << "Set goals for " << department_ << endl;
}

class Programmer : public Employee {
 private:
  string language_;

 public:
  Programmer(const string name, const int salary, const string language);
  ~Programmer();

  void print_report() const override;

  void write_code() const;
};

Programmer::Programmer(const string name, const int salary,
                       const string language)
    : Employee{name, salary}, language_(language) {
  Employee::performance_score_ = 10;
}

Programmer::~Programmer() {}

void Programmer::print_report() const {
  Employee::print_report();
  cout << "Language: " << language_ << endl;
}

void Programmer::write_code() const {
  cout << "Writing code in " << language_ << endl;
}

class Salesperson : public Employee {
 private:
  int sales_;

 public:
  Salesperson(const string name, const int salary, const int sales);
  ~Salesperson();

  void print_report() const override;

  void sell() const;
};

Salesperson::Salesperson(const string name, const int salary, const int sales)
    : Employee{name, salary}, sales_(sales) {
  Employee::performance_score_ = 20;
}

Salesperson::~Salesperson() {}

void Salesperson::print_report() const {
  Employee::print_report();
  cout << "Sales: " << sales_ << endl;
}

void Salesperson::sell() const {
  cout << "Selling products, generated " << sales_ << " in revenue" << endl;
}