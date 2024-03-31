import Foundation

let n = Int(readLine()!)!
var triangle = [[Int]]()
for _ in 0..<n {
    triangle.append(readLine()!.split(separator: " ").map { Int($0)! })
}
var dp = Array(repeating: Array(repeating: 0, count: n), count: n)
dp[0][0] = triangle[0][0]

for i in 1..<n {
    dp[i][0] = dp[i-1][0] + triangle[i][0]
    if n > 2 {
        for j in 1..<i {
            dp[i][j] = max(dp[i-1][j-1], dp[i-1][j]) + triangle[i][j]
        }
    }
    dp[i][i] = dp[i-1][i-1] + triangle[i][i]
}

print(dp[n-1].max()!)