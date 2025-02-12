def solution(nums):
    N = len(nums)
    types = set(nums)
    return min(len(types), N // 2)