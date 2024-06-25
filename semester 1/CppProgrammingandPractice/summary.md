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

### 원리

`remove`의 반환값은 마지막으로 삭제한 뒤 남은 원소의 마지막 위치를 반환

하지만 `remove`는 삭제할 값을 뒤로 밀어버린 뒤 공간을 남겨두기 떄문에

`erase`로 `remove`가 반환한 인덱스부터 끝까지 삭제

## stringstream

```cpp
#include <iostream>
#include <sstream>

int main() {
    std::string str = "1 2 3 4 5";
    std::stringstream ss(str);

    while (ss >> n) {
        std::cout << n << std::endl;
    }
}
```

### 원리

`stringstream`은 문자열을 공백이나 `\n` 단위로 분할하여 반환

### ref

- `istringstream`: `stringstream` + 파싱
- `ostringstream`: join
