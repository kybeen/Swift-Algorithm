import Foundation

let n = Int(readLine()!)!
var triangle = [[Int]]()
for _ in 0..<n {
    triangle.append(readLine()!.split(separator: " ").map{ Int($0)! })
}

// dp[i][j] : [i][j]번째 위치까지 내려왔을 때 최대값
var dp = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
dp[0][0] = triangle[0][0]
if n > 1 {
    for i in 1..<n {
        // 맨 왼쪽과 오른쪽은 내려올 수 있는 경우의 수가 1가지 뿐
        dp[i][0] = dp[i-1][0] + triangle[i][0]
        dp[i][i] = dp[i-1][i-1] + triangle[i][i]
        for j in 1..<i {
            dp[i][j] = max(dp[i-1][j-1], dp[i-1][j]) + triangle[i][j]
        }
    }
}

print(dp[n-1].max()!)