def solution(triangle):
    length = len(triangle)
    dp = [[0] * length for _ in range(length)]
    dp[0][0] = triangle[0][0]

    for i in range(1, length):
        for j in range(i+1):
            dp[i][j] = triangle[i][j]
            if j == 0:
                dp[i][j] += dp[i-1][j]
            elif j == i:
                dp[i][j] += dp[i-1][j-1]
            else:
                dp[i][j] += max(dp[i-1][j], dp[i-1][j-1])

    return max(dp[length - 1])