import Foundation

func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
    var roades = Array(repeating: Array(repeating: Int.max, count: N+1), count: N+1)
    var cost = Array(repeating: Int.max, count: N+1) // cost[i]: 1번 마을에서 i번 마을까지 최소 시간
    for r in road {
        let (a, b, time) = (r[0], r[1], r[2])
        roades[a][b] = min(roades[a][b], time)
        roades[b][a] = min(roades[b][a], time)
    }
    
    var idx = 0
    var queue = [(town: Int, time: Int)]()
    
    queue.append((1, 0))
    while idx < queue.count {
        let now = queue[idx]
        cost[now.town] = min(cost[now.town], now.time)
        
        for next in 1...N {
            guard roades[now.town][next] != Int.max else { continue }
            let nextCost = now.time + roades[now.town][next]
            if nextCost <= cost[next] {
                queue.append((next, nextCost))
            }
        }
        
        idx += 1
    }

    return cost.filter { $0 <= k }.count
}