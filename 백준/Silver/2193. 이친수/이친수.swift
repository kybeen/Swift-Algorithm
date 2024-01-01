import Foundation

let n = Int(readLine()!)!
if n == 1 {
    print(1)
} else {
    // dp[i][j] : 길이가 i일 때 j로 끝나는 이친수의 개수
    var dp = [[Int]](repeating: [Int](repeating: 0, count: 2), count: n+1)
    dp[1] = [0, 1]
    for i in 2...n {
        dp[i][0] = dp[i-1][0] + dp[i-1][1]
        dp[i][1] = dp[i-1][0]
    }
    print(dp[n].reduce(0){ $0 + $1 })
}