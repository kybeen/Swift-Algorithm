import Foundation

struct Edge {
    let to: Int
    let cost: Int
    
    init(_ to: Int, _ cost: Int) {
        self.to = to
        self.cost = cost
    }
}

func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
    var nodes = Array(repeating: [Edge](), count: N+1)
    
    for edge in road {
        let (a, b, cost) = (edge[0], edge[1], edge[2])
        nodes[a].append(Edge(b, cost))
        nodes[b].append(Edge(a, cost))
    }
    
    var costs = Array(repeating: Int.max, count: N+1)
    var queue = [(node: Int, cost: Int)]()
    costs[1] = 0
    queue.append((1, 0))
    
    while !queue.isEmpty {
        queue.sort(by: { $0.cost < $1.cost })
        let now = queue.removeFirst()
        
        for edge in nodes[now.node] {
            let next = edge.to
            let nextCost = now.cost + edge.cost
            if nextCost < costs[next] {
                costs[next] = nextCost
                queue.append((next, nextCost))
            }
        }
    }

    return costs.filter({ $0 <= k }).count
}