#include <future>

void inc(std::promise<int>&& result);
int getCounter();