#O(lg n) time complexity

def isPowerOfTwo(n):
  if n == 0:
    return False
  while n%2 == 0:
    n = n/2
  
  if n==1:
    return True
  else:
    return False


print(isPowerOfTwo(4))
print(isPowerOfTwo(8))
print(isPowerOfTwo(5))

#O(1) time complexity
def isPowerOfTwo(n):
  if n == 0:
    return False

  diff_bits = n & (n-1)
  if diff_bits == 0:
    return True
  else:
    return False

print(isPowerOfTwo(4))
print(isPowerOfTwo(8))
print(isPowerOfTwo(5))


