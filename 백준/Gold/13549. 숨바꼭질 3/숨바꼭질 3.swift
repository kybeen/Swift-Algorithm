import Foundation

let NK = readLine()!.split(separator: " ").map { Int($0)! }
let N = NK[0]
let K = NK[1]

var idx = 0
var queue = [(Int, Int)]() // (현재 위치, 걸린 시간)
var visited = [Bool](repeating: false, count: 100_001)

queue.append((N, 0))
visited[N] = true

while idx < queue.count {
    let now = queue[idx]
    
    if now.0 == K {
        print(now.1)
        break
    }
    
    // 2*X 위치로 이동하는 경우 걸리는 시간이 0초이기 때문에 이 경우를 먼저 확인
    if 0...100_000 ~= now.0*2 && !visited[now.0*2] {
        visited[now.0*2] = true
        queue.append((now.0*2, now.1))
    }
    if 0...100_000 ~= now.0-1 && !visited[now.0-1] {
        visited[now.0-1] = true
        queue.append((now.0-1, now.1+1))
    }
    if 0...100_000 ~= now.0+1 && !visited[now.0+1] {
        visited[now.0+1] = true
        queue.append((now.0+1, now.1+1))
    }
    
    idx += 1
}