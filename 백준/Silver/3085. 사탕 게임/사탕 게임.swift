import Foundation

let N = Int(readLine()!)!
var board = [[Character]]()
for _ in 0..<N {
    let row = Array(readLine()!)
    board.append(row)
}

typealias Point = (i: Int, j: Int)

func swap(a: Point, b: Point) -> [[Character]] {
    var newBoard = board
    let valA = board[a.i][a.j]
    let valB = board[b.i][b.j]
    newBoard[a.i][a.j] = valB
    newBoard[b.i][b.j] = valA
    return newBoard
}

func checkMaxCandyLine(_ board: [[Character]]) -> Int {
    var maxCnt = 0
    // 가장 긴 연속 부분 행 검사
    for i in 0..<N {
        var temp = 1
        var before = board[i][0]
        for j in 1..<N {
            if board[i][j] == before {
                temp += 1
            } else {
                temp = 1
                before = board[i][j]
            }
            maxCnt = max(maxCnt, temp)
        }
    }
    // 가장 긴 연속 부분 열 검사
    for j in 0..<N {
        var temp = 1
        var before = board[0][j]
        for i in 1..<N {
            if board[i][j] == before {
                temp += 1
            } else {
                temp = 1
                before = board[i][j]
            }
            maxCnt = max(maxCnt, temp)
        }
    }
    
    return maxCnt
}

var result = 0

for i in 0..<N {
    for j in 0..<N {
        // 색이 다른 인접한 오른쪽과 교체
        if j < N-1 {
            if board[i][j] != board[i][j+1] {
                let swappedBoard = swap(a: (i, j), b: (i, j+1))
                result = max(result, checkMaxCandyLine(swappedBoard))
            }
        }
        // 색이 다른 인접한 아래와 교체
        if i < N-1 {
            if board[i][j] != board[i+1][j] {
                let swappedBoard = swap(a: (i, j), b: (i+1, j))
                result = max(result, checkMaxCandyLine(swappedBoard))
            }
        }
    }
}

print(result)