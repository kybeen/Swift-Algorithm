import Foundation

func solution(_ board:[String]) -> Int {
    let board = board.map { row in
        row.map({ String($0) })
    }
    let rowCnt = board.count
    let colCnt = board[0].count
    
    var startI = 0
    var startJ = 0
    for i in 0..<rowCnt {
        for j in 0..<colCnt {
            if board[i][j] == "R" {
                startI = i
                startJ = j
            }
        }
    }
    
    var idx = 0
    var queue = [(i: Int, j: Int, moveCount: Int)]()
    var visited = Array(repeating: Array(repeating: false, count: colCnt), count: rowCnt)
    queue.append((startI, startJ, 0))
    visited[startI][startJ] = true
    
    var answer = -1
    let di = [0, 0, -1, 1]
    let dj = [-1, 1, 0, 0]
    while idx < queue.count {
        let now = queue[idx]
        if board[now.i][now.j] == "G" {
            answer = now.moveCount
            break
        }
        
        for k in 0..<4 {
            var (nextI, nextJ) = (now.i, now.j)
            
            while true {
                let ni = nextI + di[k]
                let nj = nextJ + dj[k]
                
                if ni < 0 || nj < 0 || ni >= rowCnt || nj >= colCnt { break }
                if board[ni][nj] == "D" { break }
                
                nextI = ni
                nextJ = nj
            }
            
            if !visited[nextI][nextJ] {
                visited[nextI][nextJ] = true
                queue.append((nextI, nextJ, now.moveCount+1))
            }
        }
        
        idx += 1
    }
    
    return answer
}