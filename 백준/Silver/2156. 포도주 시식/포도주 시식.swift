import Foundation

let n = Int(readLine()!)!
var grape: [Int] = [0]
for _ in 0..<n {
    grape.append(Int(readLine()!)!)
}

var dp = [Int](repeating: 0, count: 10001)
dp[1] = grape[1]
if n > 1 {
    dp[2] = grape[1] + grape[2]
}
if n > 2 {
    for i in 3...n {
        dp[i] = max(
            dp[i-1],
            dp[i-2] + grape[i],
            dp[i-3] + grape[i-1] + grape[i]
        )
    }
}

print(dp[n])