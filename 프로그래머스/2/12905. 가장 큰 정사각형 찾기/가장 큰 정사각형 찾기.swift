import Foundation

func solution(_ board:[[Int]]) -> Int {
    let rowCount = board.count
    let colCount = board[0].count
    var dp = board
    
    if rowCount == 1 {
        return dp[0].max()!
    }
    
    var maxSquareLength = 0
    for i in 1..<rowCount {
        for j in 1..<colCount {
            let left = dp[i][j-1]
            let up = dp[i-1][j]
            let leftUp = dp[i-1][j-1]
            if board[i][j] == 1 {
                dp[i][j] = min(left, up, leftUp) + 1
                maxSquareLength = max(maxSquareLength, dp[i][j])
            }
        }
    }

    return maxSquareLength * maxSquareLength
}