def pivotIndex(nums):
    """
    Finds the pivot index of the array where the sum of the numbers to the left 
    of the index is equal to the sum of the numbers to the right of the index.

    Parameters:
    nums (List[int]): A list of integers.

    Returns:
    int: The pivot index if it exists, otherwise -1.
    """
    s = sum(nums)
    leftsum = 0
    for i, x in enumerate(nums):
        if leftsum == (s - leftsum - x):
            return i
        leftsum += x
    return -1

index = index(nums = [1,7,3,6,5,6])
print(index)