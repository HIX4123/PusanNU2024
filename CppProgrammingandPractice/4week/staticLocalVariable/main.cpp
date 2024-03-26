#include <future>
#include <iostream>
#include <thread>

#include "static.h"

int main() {
  std::promise<int> r1, r2;
  auto f1 = r1.get_future();
  auto f2 = r2.get_future();
  std::thread t1(&inc, std::move(r1));
  std::thread t2(&inc, std::move(r2));
  t1.join();
  t2.join();
  std::cout << f1.get() << std::endl;
  std::cout << f2.get() << std::endl;

  for (int i = 0; i < 10; i++) std::cout << getCounter() << std::endl;
}