/*
 Swift는 큐를 지원하지 않기 때문에 직접 구현하거나 인덱스를 통해 큐처럼 사용하는 방식이 필요함
    - removeFirst()는 시간복잡도가 O(N)이라서 큐보다 느림
 */
import Foundation

let MN = readLine()!.split(separator: " ").map { Int($0)! }
let M = MN[0]
let N = MN[1]
var tomatoes = [[Int]]()
for _ in 0..<N {
    tomatoes.append(readLine()!.split(separator: " ").map { Int($0)! })
}
var days = 0
var isAllRipe = true

let di = [-1, 1, 0, 0]
let dj = [0, 0, -1, 1]

var idx = 0 // 큐처럼 사용하기 위한 인덱스
var queue = [(Int, Int, Int)]() // (i좌표, j좌표, 익는데 걸린 일 수)
// 익은 토마토들의 좌표 큐에 넣기 (시작점들)
for i in 0..<N {
    for j in 0..<M {
        if tomatoes[i][j] == 1 {
            queue.append((i, j, 0))
        }
    }
}

while idx < queue.count {
    let now = queue[idx]
    
    for k in 0..<4 {
        let new_i = now.0 + di[k]
        let new_j = now.1 + dj[k]
        
        if new_i < 0 || new_i >= N || new_j < 0 || new_j >= M {
            continue
        }
        if tomatoes[new_i][new_j] == 0 {
            queue.append((new_i, new_j, now.2+1))
            tomatoes[new_i][new_j] = 1
            days = max(days, now.2+1) // 최대 일 수 갱신 (BFS 탐색이기 때문에 토마토가 다 익는다면 가장 큰 일수가 최소 일수가 됨)
        }
    }
    idx += 1
}

for i in 0..<N {
    // 토마토가 모두 익었는지 체크
    if tomatoes[i].contains(0) {
        isAllRipe = false
        break
    }
}

print(isAllRipe ? days : -1)