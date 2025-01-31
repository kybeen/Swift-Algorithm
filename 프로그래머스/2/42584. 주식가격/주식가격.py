def solution(prices):
    stk = [0]
    n = len(prices)
    result = [0] * n

    for i in range(1, n):
        while stk and prices[i] < prices[stk[-1]]:
            last = stk.pop()
            result[last] = i - last
        stk.append(i)

    if stk:
        last = stk.pop()
        result[last] = 0
        while stk:
            from_idx = stk.pop()
            result[from_idx] = last - from_idx

    return result