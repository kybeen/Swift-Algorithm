import Foundation

let T = Int(readLine()!)!
for _ in 0..<T {
    let NM = readLine()!.split(separator: " ").map { Int($0)! }
    let N = NM[0]
    let M = NM[1]
    // dp[i][j]: i개 중 j개 고르는 경우의 수
    var dp = Array(repeating: Array(repeating: 0, count: N+1), count: M+1)
    
    dp[0][0] = 1
    for i in 1...M {
        for j in 0...N {
            if j == 0 || j == i {
                dp[i][j] = 1
            } else {
                dp[i][j] = dp[i-1][j] + dp[i-1][j-1]
            }
        }
    }
    print(dp[M][N])
}