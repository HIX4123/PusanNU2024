from typing import List
import heapq

def findKthLargest(nums: List[int], k: int) -> int:
    """
    Find the k-th largest element in an unsorted list of integers.

    Args:
        nums (List[int]): The list of integers.
        k (int): The k-th position to find the largest element.

    Returns:
        int: The k-th largest element in the list.

    Example:
        >>> findKthLargest([3, 2, 1, 5, 6, 4], 2)
        5
        >>> findKthLargest([3, 2, 3, 1, 2, 4, 5, 5, 6], 4)
        4
    """
#    return heapq.nlargest(k, nums)[-1]
    return heapq.nlargest(k, nums)[-1]

KthLargest = findKthLargest(nums = [3,2,1,5,6,4], k=2)
print(KthLargest)