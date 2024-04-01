import Foundation

let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0]
let M = NM[1]
var miro = [[Character]]()
for _ in 0..<N {
    miro.append(Array(readLine()!))
}

var idx = 0
var queue = [(point:(i:Int, j:Int), passed:Int)]() // (현재좌표:(i좌표, j좌표), 지난칸수)
var visited = Array(repeating: Array(repeating: false, count: M), count: N)

queue.append(((0, 0), 1))
visited[0][0] = true

let di = [-1, 1, 0, 0]
let dj = [0, 0, -1, 1]

while idx < queue.count {
    let now = queue[idx]
    // BFS 탐색이기 때문에 목적지 도착하면 최소 칸수만큼 이동한거임
    if now.point == (N-1, M-1) {
        print(now.passed)
        break
    }
    
    for k in 0..<4 {
        let new_i = now.point.i + di[k]
        let new_j = now.point.j + dj[k]
        
        if new_i < 0 || new_j < 0 || new_i >= N || new_j >= M {
            continue
        }
        // 아직 방문하지 않은 칸 && 이동할 수 있는 칸이면 이동
        if !visited[new_i][new_j] && miro[new_i][new_j] == "1" {
            visited[new_i][new_j] = true
            queue.append(((new_i, new_j), now.passed+1))
        }
    }
    
    idx += 1
}