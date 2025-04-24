import Foundation

struct Point {
    let i: Int
    let j: Int
    
    init(_ i: Int, _ j: Int) {
        self.i = i
        self.j = j
    }
}

let NM = readLine()!.components(separatedBy: " ").map({ Int($0)! })
let (N, M) = (NM[0], NM[1])
var board = [[Int]]()
for _ in 0..<N {
    board.append(readLine()!.components(separatedBy: " ").map({ Int($0)! }))
}
//board.forEach { print($0) }

// 바이러스 설치 가능 좌표 구하기
var virus = [Point]()
for i in 0..<N {
    for j in 0..<N {
        if board[i][j] == 2 {
            virus.append(Point(i, j))
        }
    }
}
// 바이러스 설치 조합 구하기
var virusCombs = [[Point]]()
var stk = [Point]()
func dfs(_ start: Int) {
    if stk.count == M {
        virusCombs.append(stk)
        return
    }
    
    for i in start..<virus.count {
        stk.append(virus[i])
        dfs(i+1)
        _ = stk.popLast()
    }
}
dfs(0)
//virusCombs.forEach { print($0) }

// 바이러스 전파되는 최단 시간 구하기
var answer = Int.max
let di = [-1, 1, 0, 0]
let dj = [0, 0, -1, 1]
for comb in virusCombs {
    var idx = 0
    var queue = [(now: Point, time: Int)]()
    var visited = Array(repeating: Array(repeating: false, count: N), count: N)
    for virus in comb {
        visited[virus.i][virus.j] = true
        queue.append((virus, 0))
    }
    
    var spreadTime = 0
    while idx < queue.count {
        let (now, time) = queue[idx]
        spreadTime = max(spreadTime, time)
        
        for k in 0..<4 {
            let nextI = now.i + di[k]
            let nextJ = now.j + dj[k]
            guard nextI >= 0 && nextJ >= 0 && nextI < N && nextJ < N else { continue }
            if !visited[nextI][nextJ] && (board[nextI][nextJ] != 1) {
                visited[nextI][nextJ] = true
                queue.append((Point(nextI, nextJ), time+1))
            }
        }
        
        idx += 1
    }
    
    var isSuccess = true
    loop: for i in 0..<N {
        for j in 0..<N {
            if !visited[i][j] && (board[i][j] != 1) {
                isSuccess = false
                break loop
            }
        }
    }
    if isSuccess {
        answer = min(answer, spreadTime)
    }
}
print(answer == Int.max ? -1 : answer)