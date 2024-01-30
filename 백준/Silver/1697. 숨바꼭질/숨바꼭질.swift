import Foundation

let NK = readLine()!.split(separator: " ").map { Int($0)! }
let N = NK[0]
let K = NK[1]

var idx = 0
var queue = [(Int, Int)]() // (현재 위치, 걸린 시간)
var visited = [Bool](repeating: false, count: 100001)

queue.append((N, 0))
visited[N] = true
while idx < queue.count {
    let now = queue[idx]
    
    // K에 도착하면 종료
    if now.0 == K {
        print(now.1)
        exit(0)
    }
    
    // 이동할 수 있는 각 위치
    let nextA = now.0 - 1
    let nextB = now.0 + 1
    let nextC = now.0 * 2
    
    func goBFS(_ next: Int) {
        // 0 ~ 100,000의 범위 안에 들어오면서 방문하지 않은 경우에만 진행
        if 0...100000 ~= next {
            if !visited[next] {
                queue.append((next, now.1+1))
                visited[next] = true
            }
        }
    }
    goBFS(nextA)
    goBFS(nextB)
    goBFS(nextC)

    idx += 1
}