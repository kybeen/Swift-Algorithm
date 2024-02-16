import Foundation

let N = Int(readLine()!)!

// columns[i] : i번 행에 퀸이 있는 열의 위치
var columns = [Int]()
var result = 0

// 해당 좌표가 현재 퀸들의 대각선에 위치하는지 확인하는 함수
func diagonalCheck(_ row: Int, _ col: Int) -> Bool {
    for i in 0..<columns.count {
        let rowDiff = abs(i - row)
        let colDiff = abs(columns[i] - col)
        if rowDiff == colDiff {
            return true
        }
    }
    return false
}

func dfs(_ row: Int) {
    // N개 퀸을 모두 놓으면
    if row == N {
        result += 1
        return
    }
    
    for col in 0..<N {
        // 현재 배치된 퀸들과 겹치지 않는 열이라면
        if !columns.contains(col) {
            // 현재 배치된 퀸들의 대각선에도 위치하지 않는 row,col 이라면 DFS
            if !diagonalCheck(row, col) {
                columns.append(col)
                dfs(row+1)
                _ = columns.popLast()
            }
        }
    }
}

dfs(0)
print(result)