# -*- coding: utf-8 -*-
# UTF-8 encoding when using korean

from sys import stdin
from time import time
import random


def main():
    length = 100
    nums = random.sample(range(1, 10000), length)
    
    total_sum = sum(nums)
    left_sum = 0
    
    results = []
    for num in nums:
        right_sum = total_sum - left_sum - num
        results.append(abs(left_sum - right_sum))
        left_sum += num
    
    return results


if __name__ == "__main__":
    start = time()
    for i in range(10000):
        main()
    end = time()

    print(f"Time: {(end-start)/10000:.6f} sec")


# 0.000062 sec