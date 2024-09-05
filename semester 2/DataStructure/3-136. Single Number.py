from typing import List

# hashMap Approach


def singleNumberHash(nums: List[int]) -> int:
    """
    Finds the single number in a list of integers using a hash set.
    Args:
      nums (List[int]): A list of integers.
    Returns:
      int: The single number in the list.
    Example:
      >>> singleNumberHash([1, 2, 2, 3, 1])
      3
    """

    num_set = set()
    for num in nums:
        if num in num_set:
            num_set.remove(num)

        else:
            num_set.add(num)

    single_num = num_set.pop()
    return single_num


singleNumberHash(nums=[5, 1, 3, 1, 3, 2, 2])

def singleNumber(nums):
    """
    Finds the single number in a list of integers.
    Parameters:
    nums (List[int]): A list of integers.
    Returns:
    int: The single number in the list.
    """
    single_num = 0
    for num in nums:
        single_num ^= num
    return single_num


singleNumber(nums=[5, 1, 3, 1, 3, 2, 2])