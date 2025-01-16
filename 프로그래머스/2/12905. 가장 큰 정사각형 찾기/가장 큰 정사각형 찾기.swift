import Foundation

func solution(_ board:[[Int]]) -> Int {
    let rowCnt = board.count
    let colCnt = board[0].count
    var dp = board
    var maxSquareLength = 0
    
    // 입력이 1개 행밖에 없는 경우 예외처리
    if rowCnt == 1 {
        return dp[0].max()!
    }
    
    for i in 1..<rowCnt {
        for j in 1..<colCnt {
            if board[i][j] == 1 {
                dp[i][j] = min(dp[i-1][j], dp[i][j-1], dp[i-1][j-1]) + 1
                maxSquareLength = max(maxSquareLength, dp[i][j])
            }
        }
    }

    return maxSquareLength * maxSquareLength
}