def minSubArrayLen(target, nums):
    """
    Finds the minimal length of a contiguous subarray of which the sum is at least `target`.
    If there is no such subarray, returns 0.

    Parameters:
    target (int): The target sum for the subarray.
    nums (List[int]): The list of positive integers.

    Returns:
    int: The minimal length of a contiguous subarray with sum at least `target`, or 0 if no such subarray exists.
    """
    min_len = float('inf')
    left = 0
    sum = 0
    for i in range(0, len(nums)):
        sum += nums[i]
        while (sum >= target):
            min_len = min(min_len, i + 1 - left)
            sum -= nums[left]
            left += 1
    return min_len if (min_len != (len(nums) + 1)) else 0

tar=7
n=[2,3,1,2,4,3]

print(minSubArrayLen(tar,n))