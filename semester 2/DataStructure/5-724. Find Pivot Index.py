from typing import List
import heapq

def findKthLargest(nums: List[int], k: int) -> int:
#    return heapq.nlargest(k, nums)[-1]
    return heapq.nlargest(k, nums)[-1]

KthLargest = findKthLargest(nums = [3,2,1,5,6,4], k=2)
print(KthLargest)