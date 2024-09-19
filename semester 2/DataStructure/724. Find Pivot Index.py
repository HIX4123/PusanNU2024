def pivotIndex(nums):
    s = sum(nums)
    leftsum = 0
    for i, x in enumerate(nums):
        if leftsum == (s - leftsum - x):
            return i
        leftsum += x
    return -1

index = index(nums = [1,7,3,6,5,6])
print(index)