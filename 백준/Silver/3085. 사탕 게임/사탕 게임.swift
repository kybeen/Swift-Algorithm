import Foundation

let n = Int(readLine()!)!
var board = [[Character]]()
for _ in 0..<n {
    let row = Array(readLine()!)
    board.append(row)
}

// 가로 행의 최대 개수 체크
func checkMaxRowCount(arr: [[Character]], n: Int) -> Int {
    var result = 0
    var beforeChr: Character = arr[0][0]
    for i in 0..<n {
        var temp = 1
        beforeChr = arr[i][0]
        for j in 1..<n {
            if arr[i][j] == beforeChr {
                temp += 1
            } else {
                temp = 1
            }
            beforeChr = arr[i][j]
            result = max(result, temp)
        }
    }
    return result
}

// 세로 열의 최대 개수 체크
func checkMaxColCount(arr: [[Character]], n: Int) -> Int {
    var result = 0
    var beforeChr: Character = arr[0][0]
    for j in 0..<n {
        var temp = 1
        beforeChr = arr[0][j]
        for i in 1..<n {
            if arr[i][j] == beforeChr {
                temp += 1
            } else {
                temp = 1
            }
            beforeChr = arr[i][j]
            result = max(result, temp)
        }
    }
    return result
}

var result = 0
for i in 0..<n {
    for j in 0..<n {
        if j < n-1 {
            // 색이 다른 인접한 오른쪽이랑 교체
            var temp = board
            if temp[i][j] != temp[i][j+1] {
                temp[i].swapAt(j, j+1)
                // 가로/세로 최대 개수 체크
                result = max(result, checkMaxRowCount(arr: temp, n: n))
                result = max(result, checkMaxColCount(arr: temp, n: n))
            }
        }
        
        if i < n-1 {
            // 색이 다른 인접한 아래랑 교체
            var temp = board
            if temp[i][j] != temp[i+1][j] {
                let a = temp[i][j]
                let b = temp[i+1][j]
                temp[i][j] = b
                temp[i+1][j] = a
                // 가로/세로 최대 개수 체크
                result = max(result, checkMaxRowCount(arr: temp, n: n))
                result = max(result, checkMaxColCount(arr: temp, n: n))
            }
        }
    }
}

print(result)