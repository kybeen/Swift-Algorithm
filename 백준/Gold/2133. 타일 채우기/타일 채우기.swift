// 그려보고 규칙 찾아야 함
import Foundation

let N = Int(readLine()!)!
var dp = [Int](repeating: 0, count: 31)
dp[2] = 3

for i in 3..<31 {
    if i%2 == 0 {
        dp[i] += (dp[i-2]*dp[2])
        for j in 1..<(i/2)-1 {
            dp[i] += 2*dp[j*2]
        }
        dp[i] += 2
    }
}

print(dp[N])