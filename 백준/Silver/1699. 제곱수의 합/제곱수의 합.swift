import Foundation

let n = Int(readLine()!)!
// dp[n] : n을 제곱수 합으로 나타낼 때 최소항의 개수
var dp = [Int](0...n)

// 제곱수들은 1로 세팅
for i in 1...Int(sqrt(Double(n))) {
    dp[i*i] = 1
}
if n > 1 {
    for i in 2...n {
        var j = 1
        while (i - j*j) >= 1 {
            dp[i] = min(dp[i], dp[i-j*j] + 1)
            j += 1
        }
    }
}

print(dp[n])