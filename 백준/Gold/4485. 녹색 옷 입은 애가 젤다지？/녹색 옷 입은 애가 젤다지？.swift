struct Point {
    let i: Int
    let j: Int
    
    init(_ i: Int, _ j: Int) {
        self.i = i
        self.j = j
    }
}

func bfs(_ rupees: inout [[Int]]) -> Int {
    let N = rupees.count
    var cost = Array(repeating: Array(repeating: Int.max, count: N), count: N)
    let di = [-1, 1, 0, 0]
    let dj = [0, 0, -1, 1]
    
    var queue = [(point: Point, cost: Int)]()
    queue.append((Point(0,0), rupees[0][0]))
    
    while !queue.isEmpty {
        queue.sort(by: { $0.cost < $1.cost })
        let now = queue.removeFirst()
        
        if now.point.i == N-1 && now.point.j == N-1 {
            continue
        }
        
        for k in 0..<4 {
            let nextI = now.point.i + di[k]
            let nextJ = now.point.j + dj[k]
            guard nextI >= 0 && nextJ >= 0 && nextI < N && nextJ < N else { continue }
            let nextCost = now.cost + rupees[nextI][nextJ]
            if nextCost < cost[nextI][nextJ] {
                cost[nextI][nextJ] = nextCost
                queue.append((Point(nextI, nextJ), nextCost))
            }
        }
    }
    
    return cost[N-1][N-1]
}

var result = [Int]()
while let N = Int(readLine()!), N != 0 {
    var rupees = [[Int]]()
    for _ in 0..<N {
        let row = readLine()!.split(separator: " ").map({ Int($0)! })
        rupees.append(row)
    }
    
    result.append(bfs(&rupees))
}

for (idx, value) in result.enumerated() {
    print("Problem \(idx+1): \(value)")
}