import Foundation

struct Point: Equatable {
    let i: Int
    let j: Int
    
    init(_ i: Int, _ j: Int) {
        self.i = i
        self.j = j
    }
    
    func getDirection(to: Point) -> Direction {
        return (self.i == to.i) && (self.j != to.j) ? .horizontal : .vertical
    }
}

enum Direction {
    case vertical
    case horizontal
}

func solution(_ board:[[Int]]) -> Int {
    let length = board.count
    let di = [-1, 1, 0, 0]
    let dj = [0, 0, -1, 1]
    var cost = Array(repeating: Array(repeating: [Int.max, Int.max], count: length), count: length)
    
    func dfs(_ now: Point, _ nowDirection: Direction, _ nowCost: Int) {
        if now == Point(length-1, length-1) {
            return
        }
        
        for k in 0..<4 {
            let next = Point(now.i+di[k], now.j+dj[k])
            guard next.i >= 0 && next.j >= 0 && next.i < length && next.j < length else { continue }
            
            if board[next.i][next.j] == 0 {
                let nextDirection = now.getDirection(to: next)
                let nextCost = nowCost + (nowDirection == nextDirection ? 100 : 600)
                let dirIdx = (nextDirection == .vertical) ? 0 : 1
                
                if nextCost < cost[next.i][next.j][dirIdx] {
                    cost[next.i][next.j][dirIdx] = nextCost
                    dfs(next, nextDirection, nextCost)
                }
            }
        }
    }
    
    cost[0][0][0] = 0
    cost[0][0][1] = 0
    
    // 오른쪽으로 시작
    if board[0][1] == 0 {
        cost[0][1][0] = 100
        dfs(Point(0,1), .horizontal, 100)
    }
    // 아래로 시작
    if board[1][0] == 0 {
        cost[1][0][1] = 100
        dfs(Point(1,0), .vertical, 100)
    }
    
    return min(cost[length-1][length-1][0], cost[length-1][length-1][1])
}