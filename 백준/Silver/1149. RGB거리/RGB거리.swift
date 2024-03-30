import Foundation

let N = Int(readLine()!)!
var cost = [[Int]]()
for _ in 0..<N {
    cost.append(readLine()!.split(separator: " ").map { Int($0)! })
}
var dp = [[Int]](repeating: [Int](repeating: 0, count: 3), count: N)
dp[0] = cost[0]
for i in 1...N-1 {
    dp[i][0] = min(dp[i-1][1], dp[i-1][2]) + cost[i][0]
    dp[i][1] = min(dp[i-1][0], dp[i-1][2]) + cost[i][1]
    dp[i][2] = min(dp[i-1][0], dp[i-1][1]) + cost[i][2]
}
print(dp[N-1].min()!)