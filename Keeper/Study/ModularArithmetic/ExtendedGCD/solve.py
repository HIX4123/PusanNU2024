def euclidianEx(a, b):
    if b == 0:
        return (1, 0, a)
    else:
        x, y, d = euclidianEx(b, a % b)
        return (y, x - y * (a // b), d)


print(euclidianEx(26513, 32321))
