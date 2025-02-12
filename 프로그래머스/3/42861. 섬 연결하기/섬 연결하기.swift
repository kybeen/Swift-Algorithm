import Foundation

func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    var sortedEdges = costs.sorted { $0[2] < $1[2] }
    var parent = Array(0..<n)
    var rank = Array(repeating: 0, count: n)
    var result = 0
    
    func union(_ rootA: Int, _ rootB: Int) {
        if rank[rootA] < rank[rootB] {
            parent[rootA] = rootB
        } else if rank[rootB] < rank[rootA] {
            parent[rootB] = rootA
        } else {
            parent[rootB] = rootA
            rank[rootA] += 1
        }
    }
    
    func find(_ node: Int) -> Int {
        if parent[node] == node {
            return node
        } else {
            parent[node] = find(parent[node])
            return parent[node]
        }
    }
    
    for edge in sortedEdges {
        let rootA = find(edge[0])
        let rootB = find(edge[1])
        let cost = edge[2]
        
        // 사이클이 아니라면 다리를 건설 + 두 노드의 루트를 하나로 통일
        if rootA != rootB {
            union(rootA, rootB)
            result += cost
        }
    }
    
    return result
}