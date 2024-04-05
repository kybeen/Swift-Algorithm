import Foundation

let N = Int(readLine()!)!
var dp = [Int](repeating: -1, count: 5001)
dp[3] = 1
dp[5] = 1
if N > 5 {
    for i in 6...N {
        if dp[i-3] != -1 {
            dp[i] = dp[i-3] + 1
        }
        if dp[i-5] != -1 {
            dp[i] = dp[i-5] + 1
        }
    }
}
print(dp[N])