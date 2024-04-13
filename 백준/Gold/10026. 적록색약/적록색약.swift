import Foundation

let N = Int(readLine()!)!
var board = [[Character]]()
for _ in 0..<N {
    board.append(Array(readLine()!))
}

var visited = Array(repeating: Array(repeating: false, count: N), count: N)

func bfs(_ start: (i:Int, j:Int), color: Character, noRGB: Bool = false) {
    var idx = 0
    var queue = [(i:Int, j:Int)]()
    
    let di = [-1, 1, 0, 0]
    let dj = [0, 0, -1, 1]
    
    queue.append((start.i, start.j))
    while idx < queue.count  {
        let now = queue[idx]
        
        for k in 0..<4 {
            let new_i = now.i + di[k]
            let new_j = now.j + dj[k]
            
            if new_i < 0 || new_j < 0 || new_i >= N || new_j >= N {
                continue
            }
            
            if noRGB { // 적록색약일 경우
                if color == "B" { // 파란색은 그냥 확인
                    if !visited[new_i][new_j] && board[new_i][new_j] == color {
                        visited[new_i][new_j] = true
                        queue.append((new_i, new_j))
                    }
                } else { // 빨간색과 초록색은 구분하지 x
                    if !visited[new_i][new_j] && (board[new_i][new_j] == "R" || board[new_i][new_j] == "G") {
                        visited[new_i][new_j] = true
                        queue.append((new_i, new_j))
                    }
                }
            } else { // 적록색약이 아닐 경우
                if !visited[new_i][new_j] && board[new_i][new_j] == color {
                    visited[new_i][new_j] = true
                    queue.append((new_i, new_j))
                }
            }
        }
        
        idx += 1
    }
}

var result = [0, 0]
// 적록색약 아닌 사람
for i in 0..<N {
    for j in 0..<N {
        if !visited[i][j] {
            result[0] += 1
            visited[i][j] = true
            bfs((i,j), color: board[i][j])
        }
    }
}
visited = Array(repeating: Array(repeating: false, count: N), count: N)
// 적록색약인 사람
for i in 0..<N {
    for j in 0..<N {
        if !visited[i][j] {
            result[1] += 1
            visited[i][j] = true
            bfs((i,j), color: board[i][j], noRGB: true)
        }
    }
}

print("\(result[0]) \(result[1])")