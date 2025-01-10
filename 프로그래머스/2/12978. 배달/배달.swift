import Foundation

func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
    var edges: [[Int]] = Array(repeating: Array(repeating: Int.max, count: N+1), count: N+1) // 마을 간 도로 비용
    var costs: [Int] = Array(repeating: Int.max, count: N+1) // 1번 마을에서 각 마을까지의 최소 비용
    
    for r in road {
        let a = r[0]
        let b = r[1]
        let cost = r[2]
        // 도로가 여러개인 경우, 최소값만 저장
        edges[a][b] = min(edges[a][b], cost)
        edges[b][a] = min(edges[b][a], cost)
    }
    
    var idx = 0
    var queue: [(node: Int, cost: Int)] = [(1, 0)]
    costs[1] = 0
    
    while idx < queue.count {
        let now = queue[idx]
        
        for next in 1...N {
            // 현재 노드에서 인접 노드(방문 가능한 노드)로의 최단거리 갱신
            guard edges[now.node][next] != Int.max else { continue }
            
            let nextCost = now.cost + edges[now.node][next]
            if nextCost < costs[next] {
                costs[next] = nextCost
                queue.append((next, nextCost))
            }
        }
        
        idx += 1
    }

    return costs.filter { $0 <= k }.count
}