# C++프로그래밍과실습

## erase-remove idiom

```cpp
#include <vector>
#include <algorithm>
#include <iostream>

int main() {
    std::vector<int> v = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};


    v.erase(std::remove(v.begin(), v.end(), 5), v.end());
}
```
