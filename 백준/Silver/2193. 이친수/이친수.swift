import Foundation

let N = Int(readLine()!)!
var dp = Array(repeating: Array(repeating: 0, count: 2), count: 91)
dp[1] = [0, 1]
if N > 1 {
    for i in 2...N {
        dp[i][0] = dp[i-1][0] + dp[i-1][1]
        dp[i][1] = dp[i-1][0]
    }
}
print(dp[N][0] + dp[N][1])