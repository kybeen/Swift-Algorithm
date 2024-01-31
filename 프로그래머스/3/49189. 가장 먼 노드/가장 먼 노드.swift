import Foundation

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    var nodes = [[Int]](repeating: [Int](), count: n+1)
    for e in edge {
        let a = e[0]
        let b = e[1]
        nodes[a].append(b)
        nodes[b].append(a)
    }
    
    var visited = [Bool](repeating: false, count: n+1)
    var maxDepth = 0
    var result = 0
    var queue = [(Int, Int)]() // (노드번호, 1번노드와의 거리)
    var idx = 0
    
    // 1번 노드부터 BFS 수행
    queue.append((1, 0))
    visited[1] = true
    while idx < queue.count {
        let now = queue[idx]
        
        if now.1 > maxDepth { // maxDepth보다 더 멀리 있는 노드가 나오면 maxDepth와 result를 갱신
            maxDepth = now.1
            result = 1
        } else if now.1 == maxDepth { // maxDepth와 같은 거리라면 result 1 증가
            result += 1
        }
        
        for node in nodes[now.0] {
            if !visited[node] {
                visited[node] = true
                queue.append((node, now.1+1))
            }
        }
        
        idx += 1
    }
    
    return result
}