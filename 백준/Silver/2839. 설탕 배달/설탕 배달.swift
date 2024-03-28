import Foundation

let N = Int(readLine()!)!
var dp = [Int](repeating: 5000, count: 5001)
dp[3] = 1
dp[5] = 1
for i in 6...5000 {
    if dp[i-3] != 5000 {
        dp[i] = min(dp[i], dp[i-3] + 1)
    }
    if dp[i-5] != 5000 {
        dp[i] = min(dp[i], dp[i-5] + 1)
    }
}

print(dp[N] != 5000 ? dp[N] : -1)