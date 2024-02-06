// 벽을 최대한 부수지 않고 이동하기 위해 벽이 없는 곳을 우선적으로 BFS 탐색
import Foundation

let MN = readLine()!.split(separator: " ").map { Int($0)! }
let M = MN[0] // 가로
let N = MN[1] // 세로
var miro = [[Int]]()
for _ in 0..<N {
    miro.append(Array(readLine()!).map { Int(String($0))! })
}

let di = [-1, 1, 0, 0]
let dj = [0, 0, -1, 1]

var queue = [(Int, Int, Int)]() // i좌표, j좌표, 부순 벽의 개수
var visited = [[Bool]](repeating: [Bool](repeating: false, count: M), count: N)

queue.append((0, 0, 0))
while !queue.isEmpty {
    let now = queue.removeFirst()
    
    if now.0 == N-1 && now.1 == M-1 {
        print(now.2)
        break
    }
    
    for k in 0..<4 {
        let new_i = now.0 + di[k]
        let new_j = now.1 + dj[k]
        
        if new_i < 0 || new_j < 0 || new_i >= N || new_j >= M {
            continue
        }
        
        if !visited[new_i][new_j] {
            visited[new_i][new_j] = true
            // 벽이 없다면 큐의 맨 앞에 추가
            if miro[new_i][new_j] == 0 {
                queue.insert((new_i, new_j, now.2), at: 0)
            } else {
                // 벽이 있다면 벽을 부수고 큐의 맨 뒤에 추가
                queue.append((new_i, new_j, now.2+1))
            }
        }
    }
}