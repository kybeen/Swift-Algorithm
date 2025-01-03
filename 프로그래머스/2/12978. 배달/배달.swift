import Foundation

func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
    var tree: [[Int]] = Array(repeating: Array(repeating: Int.max, count: N+1), count: N+1)
    var costs: [Int] = Array(repeating: Int.max, count: N+1)
    
    for r in road {
        let a = r[0]
        let b = r[1]
        let cost = r[2]
        tree[a][b] = min(tree[a][b], cost)
        tree[b][a] = min(tree[b][a], cost)
    }
    
    var idx = 0
    var queue: [(node: Int, cost: Int)] = [(1, 0)]
    costs[1] = 0
    
    while idx < queue.count {
        let now = queue[idx]
        
        // 인접 노드들의 최단거리 갱신
        for next in 1...N {
            if tree[now.node][next] == Int.max { continue }
            
            let nextCost = now.cost + tree[now.node][next]
            if nextCost < costs[next] {
                costs[next] = nextCost
                queue.append((next, nextCost))
            }
        }
        
        idx += 1
    }

    return costs.filter { $0 <= k }.count
}