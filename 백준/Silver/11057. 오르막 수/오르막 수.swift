import Foundation

let n = Int(readLine()!)!

// dp[i][j] : i번째 자릿수가 j인 오르막 수
var dp = [[Int]](repeating: [Int](repeating: 0, count: 10) ,count: n+1)
dp[1] = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
if n > 1 {
    for i in 2...n {
        dp[i][0] = 1
        for j in 1...9 {
            dp[i][j] = dp[i-1][...j].reduce(0){ $0 + $1 } % 10007
        }
    }
}
print(dp[n].reduce(0){ $0 + $1 } % 10007)