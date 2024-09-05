# O(lg n) time complexity


def isPowerOfTwo(n):
    """
    Determines if a given number is a power of two.
    Parameters:
    n (int): The number to be checked.
    Returns:
    bool: True if the number is a power of two, False otherwise.
    """
    # implementation goes here

    if n == 0:
        return False
    while n % 2 == 0:
        n = n / 2

    if n == 1:
        return True
    else:
        return False


print(isPowerOfTwo(4))
print(isPowerOfTwo(8))
print(isPowerOfTwo(5))


# O(1) time complexity
def isPowerOfTwo(n):
    """
    Determines if a given number is a power of two.
    Parameters:
    n (int): The number to check.
    Returns:
    bool: True if the number is a power of two, False otherwise.
    """

    if n == 0:
        return False

    diff_bits = n & (n - 1)
    if diff_bits == 0:
        return True
    else:
        return False


print(isPowerOfTwo(4))
print(isPowerOfTwo(8))
print(isPowerOfTwo(5))
