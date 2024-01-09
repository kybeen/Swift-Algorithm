import Foundation

let n = Int(readLine()!)!

// dp[i][j] : i번째 줄까지 사자를 배치하는 경우의 수
// j => 0:배치X  1:왼쪽배치  2:오른쪽배치
var dp = [[Int]](repeating: [Int](repeating: 0, count: 3), count: n+1)

dp[1] = [1, 1, 1]
if n > 1 {
    for i in 2...n {
        dp[i][0] = (dp[i-1][0] + dp[i-1][1] + dp[i-1][2]) % 9901 // 배치하지 않는 경우
        dp[i][1] = (dp[i-1][0] + dp[i-1][2]) % 9901 // 왼쪽에 배치하는 경우
        dp[i][2] = (dp[i-1][0] + dp[i-1][1]) % 9901 // 오른쪽에 배치하는 경우
    }
}
print(dp[n].reduce(0){ $0 + $1 } % 9901)