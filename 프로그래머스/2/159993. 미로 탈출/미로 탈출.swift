import Foundation

struct MoveInfo {
    let i: Int
    let j: Int
    var time: Int
    
    init(_ i: Int, _ j: Int, time: Int = 0) {
        self.i = i
        self.j = j
        self.time = time
    }
}

func solution(_ maps:[String]) -> Int {
    let miro = maps.map { $0.map { String($0) } }
    let ROW_COUNT = maps.count
    let COL_COUNT = maps[0].count
    var start: MoveInfo!
    var lever: MoveInfo!
    
    for i in 0..<ROW_COUNT {
        for j in 0..<COL_COUNT {
            let value = miro[i][j]
            if value == "S" {
                start = MoveInfo(i, j)
                continue
            }
            if value == "L" {
                lever = MoveInfo(i, j)
                continue
            }
        }
    }
    
    var result = 0
    var isLeverVisited = false
    var isExitVisited = false
    
    let di = [-1, 1, 0, 0]
    let dj = [0, 0, -1, 1]
    
    // BFS 함수
    func bfs(start: MoveInfo, isExitTarget: Bool) {
        let target = isExitTarget ? "E" : "L"
        var idx = 0
        var queue: [MoveInfo] = [start]
        var visited = Array(repeating: Array(repeating: false, count: COL_COUNT), count: ROW_COUNT)
        visited[start.i][start.j] = true
        
        while idx < queue.count {
            let now = queue[idx]
            if miro[now.i][now.j] == target {
                result += now.time
                if isExitTarget {
                    isExitVisited = true
                } else {
                    isLeverVisited = true
                }
                return
            }

            for k in 0..<4 {
                let nextI = now.i + di[k]
                let nextJ = now.j + dj[k]
                guard nextI >= 0 && nextJ >= 0 && nextI < ROW_COUNT && nextJ < COL_COUNT else { continue }
                if miro[nextI][nextJ] != "X" && !visited[nextI][nextJ] {
                    let moveInfo = MoveInfo(nextI, nextJ, time: now.time + 1)
                    visited[nextI][nextJ] = true
                    queue.append(moveInfo)
                }
            }

            idx += 1
        }
    }
    
    // 레버 찾기
    bfs(start: start, isExitTarget: false)
    guard isLeverVisited else { return -1 }
    
    // 출구 찾기
    bfs(start: lever, isExitTarget: true)
    guard isExitVisited else { return -1 }
    
    return result
}