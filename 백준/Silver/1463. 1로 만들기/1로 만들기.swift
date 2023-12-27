import Foundation

let n = Int(readLine()!)!

// dp[n] : n을 1로 만들기 위한 연산의 최소 횟수
// dp[1] = 0 | dp[2] = 1
var dp = [Int](repeating: 1000001, count: n+1)
dp[1] = 0
if n > 1 {
    for i in 2...n {
        dp[i] = dp[i-1] + 1 // 1을 빼는 경우
        
        if i % 2 == 0 { // 2로 나누어 떨어지는 경우
            dp[i] = min(dp[i], dp[i/2]+1)
        }
        if i % 3 == 0 { // 3으로 나누어 떨어지는 경우
            dp[i] = min(dp[i], dp[i/3]+1)
        }
    }
}
print(dp[n])