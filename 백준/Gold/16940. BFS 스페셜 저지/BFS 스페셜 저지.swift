import Foundation

let N = Int(readLine()!)!
var nodes = [[Int]](repeating: [Int](), count: N+1)
for _ in 0..<N-1 {
    let ab = readLine()!.split(separator: " ").map { Int($0)! }
    let a = ab[0]
    let b = ab[1]
    nodes[a].append(b)
    nodes[b].append(a)
}
let visitOrder = readLine()!.split(separator: " ").map { Int($0)! } // 입력으로 주어진 방문 순서

// visitOrder에 주어진 방문 순서대로 노드에 우선수위 값을 부여한다. (1~N)
var priority = [Int](repeating: -1, count: N+1)
for i in 0..<visitOrder.count {
    priority[visitOrder[i]] = i+1
}

// 인접 노드들을 priority 순서대로 정렬해서 그래프 탐색 시 priority 순서대로 방문할 수 있도록 해준다.
for i in 1...N {
    nodes[i].sort { priority[$0] < priority[$1] }
}

func bfs() -> Int {
    var idx = 0
    var queue = [Int]()
    var visited = [Bool](repeating: false, count: N+1)
    
    queue.append(1)
    visited[1] = true
    
    while idx < queue.count {
        // 현재 인덱스에 대해서 입력으로 주어진 방문 순서와 큐의 노드가 서로 다르면 올바른 순서가 아님
        guard visitOrder[idx] == queue[idx] else {
            return 0
        }
        
        let now = queue[idx]
        
        for node in nodes[now] {
            if !visited[node] {
                queue.append(node)
                visited[node] = true
            }
        }
        
        idx += 1
    }
    
    return 1
}

print(bfs())