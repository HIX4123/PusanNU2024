#include <fstream>
#include <iostream>
using namespace std;

int main() {
  // ifstream, ofstream 은 자동으로 연 파일을 닫는다.
  ifstream fin;
  fin.exceptions(ios_base::failbit | ios_base::badbit);
  try {
    fin.open("config.ini");  // default   is   ios_base::in
  } catch (const std::exception& e) {
    std::cerr << e.what() << '\n';
  }

  ofstream fout;
  fout.exceptions(ios_base::failbit | ios_base::badbit);
  try {
    fout.open("config/config.ini");  // default   is   ios_base::out
  } catch (const std::exception& e) {
    std::cerr << e.what() << '\n';
  }

  fout << "This is an example for the exception in C++!" << endl;
  return 0;
}