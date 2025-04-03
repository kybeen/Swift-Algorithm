struct Edge {
    let to: Int
    let cost: Int
    
    init(_ to: Int, _ cost: Int) {
        self.to = to
        self.cost = cost
    }
}

let NM = readLine()!.split(separator: " ").map({ Int($0)! })
let (N, M) = (NM[0], NM[1])
var nodes = Array(repeating: [Edge](), count: N+1)
for _ in 0..<M {
    let abc = readLine()!.split(separator: " ").map({ Int($0)! })
    let (a, b, cost) = (abc[0], abc[1], abc[2])
    nodes[a].append(Edge(b, cost))
    nodes[b].append(Edge(a, cost))
}

var cost = Array(repeating: Int.max, count: N+1)
cost[1] = 0
var queue = [(barn: Int, cost: Int)]()
queue.append((1, 0))

while !queue.isEmpty {
    queue.sort(by: { $0.cost < $1.cost })
    let now = queue.removeFirst()
    
    if now.barn == N {
        continue
    }
    
    for edge in nodes[now.barn] {
        let next = edge.to
        let nextCost = now.cost + edge.cost
        
        if nextCost < cost[next] {
            cost[next] = nextCost
            queue.append((next, nextCost))
        }
    }
}
print(cost[N])