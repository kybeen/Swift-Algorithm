import Foundation

let t = Int(readLine()!)!

// dp[n] : n을 1,2,3의 합으로 나타내는 방법의 수
var dp = [Int](repeating: 0, count: 1000001)
dp[1] = 1
dp[2] = 2
dp[3] = 4
for i in 4...1000000 {
    dp[i] = (dp[i-1] + dp[i-2] + dp[i-3]) % 1000000009
}

for _ in 0..<t {
    let n = Int(readLine()!)!
    print(dp[n])
}