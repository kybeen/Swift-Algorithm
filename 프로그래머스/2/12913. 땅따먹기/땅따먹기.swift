import Foundation

func solution(_ land:[[Int]]) -> Int{
    let n = land.count
    var dp = Array(repeating: [0, 0, 0, 0], count: n) // dp[i][j] i행j열로 내려왔을 때 최대 점수
    
    dp[0] = land[0]
    for i in 1..<n {
        for j in 0..<4 {
            let a = (j+1) % 4
            let b = (j+2) % 4
            let c = (j+3) % 4
            dp[i][j] = max(dp[i-1][a], dp[i-1][b], dp[i-1][c]) + land[i][j]
        }
    }
    
    return dp[n-1].max()!
}