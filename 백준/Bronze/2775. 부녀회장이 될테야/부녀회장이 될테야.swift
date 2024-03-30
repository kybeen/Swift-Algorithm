import Foundation

let T = Int(readLine()!)!
for _ in 0..<T {
    let k = Int(readLine()!)!
    let n = Int(readLine()!)!
    
    var dp = Array(repeating: Array(repeating: 0, count: n+1), count: k+1)
    for j in 1...n {
        dp[0][j] = j
    }
    for i in 1...k {
        for j in 1...n {
            dp[i][j] = dp[i][j-1] + dp[i-1][j]
        }
    }
    print(dp[k][n])
}