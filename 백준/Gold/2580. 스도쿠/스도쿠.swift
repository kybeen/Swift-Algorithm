import Foundation

var sudoku = [[Int]]()
for _ in 0..<9 {
    sudoku.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var blanks = [(Int, Int)]() // 빈칸 좌표들
for i in 0..<9 {
    for j in 0..<9 {
        if sudoku[i][j] == 0 {
            blanks.append((i, j))
        }
    }
}

// (row, col) 좌표에 value 값을 넣을 수 있는 행인지를 판단하는 함수
func isPossibleRow(_ row: Int, _ col: Int, _ value: Int) -> Bool {
    if !sudoku[row].contains(value) {
        return true
    } else {
        return false
    }
}
// (row, col) 좌표에 value 값을 넣을 수 있는 열인지를 판단하는 함수
func isPossibleColumn(_ row: Int, _ col: Int, _ value: Int) -> Bool {
    for i in 0..<9 {
        if sudoku[i][col] == value {
            return false
        }
    }
    return true
}
// (row, col) 좌표에 value 값을 넣을 수 있는 3x3 정사각형인지 판단하는 함수
func isPossibleBox(_ row: Int, _ col: Int, _ value: Int) -> Bool {
    // 해당 좌표가 속한 3x3 정사각형 내부 확인
    let rowStart = row - (row % 3)
    let colStart = col - (col % 3)
    for i in rowStart..<rowStart+3 {
        for j in colStart..<colStart+3 {
            if sudoku[i][j] == value {
                return false
            }
        }
    }
    return true
}

func dfs(_ depth: Int) {
    // 모든 빈칸을 채우면 스도쿠판 출력 후 종료
    if depth == blanks.count {
        for s in sudoku {
            print(s.map { String($0) }.joined(separator: " "))
        }
        exit(0)
    }
    
    let i = blanks[depth].0
    let j = blanks[depth].1
    for v in 1...9 {
        if isPossibleRow(i, j, v) && isPossibleColumn(i, j, v) && isPossibleBox(i, j, v) {
            sudoku[i][j] = v
            dfs(depth+1)
            sudoku[i][j] = 0
        }
    }
}

dfs(0)