import Foundation

let n = Int(readLine()!)!
var costs = [[Int]]()
for _ in 0..<n {
    costs.append(readLine()!.split(separator: " ").map{ Int($0)! })
}

// dp[i][j] : i번 집은 j색으로 칠할 경우, i번 집까지 색칠하는 최소 비용
var dp = [[Int]](repeating: [0, 0, 0], count: n)
dp[0] = costs[0]
for i in 1..<n {
    dp[i][0] = min(dp[i-1][1], dp[i-1][2]) + costs[i][0]
    dp[i][1] = min(dp[i-1][0], dp[i-1][2]) + costs[i][1]
    dp[i][2] = min(dp[i-1][0], dp[i-1][1]) + costs[i][2]
}
print(dp[n-1].min()!)