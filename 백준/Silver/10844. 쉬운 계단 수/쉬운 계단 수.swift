import Foundation

let n = Int(readLine()!)!
// dp[i][j] : 길이가 i이면서 j로 끝나는 계단수의 개수
var dp = [[Int]](repeating: [Int](repeating: 0, count: 10), count: n+1)
dp[1] = [0, 1, 1, 1, 1, 1, 1, 1, 1, 1]
if n > 1 {
    for i in 2...n {
        dp[i][0] = dp[i-1][1]
        for j in 1...8 {
            dp[i][j] = (dp[i-1][j-1] + dp[i-1][j+1]) % 1000000000
        }
        dp[i][9] = dp[i-1][8]
    }
}
print(dp[n].reduce(0){ $0 + $1 } % 1000000000)