import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{ Int($0)! }

// dp[n]: 마지막으로 인덱스n의 수를 더했을 때의 가장 큰 연속합
var dp = arr

for i in 1..<n {
    dp[i] = max(dp[i], dp[i] + dp[i-1])
}

print(dp.max()!)