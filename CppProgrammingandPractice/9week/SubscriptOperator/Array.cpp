#include "Array.h"

Array::Array(std::initializer_list<int> args, size_t size)
    : data(args), size(size) {}