import Foundation

/// 코너 여부를 확인하기 위한 좌표 방향
enum Direction {
    case vertical
    case horizontal
}

struct Point: Hashable {
    let i: Int
    let j: Int
    
    init(_ i: Int, _ j: Int) {
        self.i = i
        self.j = j
    }
}

struct QueueItem: Hashable {
    let point: Point // 현재 좌표
    let dir: Direction? // 현재 좌표로 진행해온 방향
    let sum: Int // 현재까지 건설 비용의 합
    
    init(
        _ point: Point,
        _ dir: Direction?,
        _ sum: Int
    ) {
        self.point = point
        self.dir = dir
        self.sum = sum
    }
}
    
/// 현재 진행 방향과 코너 여부를 계산하여 반환
func checkDirectionAndCorner(_ now: Point, _ next: Point, prevDir: Direction?) -> (Direction, Bool) {
    let nextDir: Direction = (now.i == next.i) ? .vertical : .horizontal
    if let prevDir = prevDir {
        return (nextDir, nextDir != prevDir)
    } else {
        // (0,0)에서 시작하는 상황에서는 prevDir가 없음
        return (nextDir, false)
    }
}

func solution(_ board:[[Int]]) -> Int {
    let N = board.count
    var cost = Array(repeating: Array(repeating: [Int.max, Int.max], count: N), count: N)
    var idx = 0
    var queue = [QueueItem]()
    
    let startPoint = Point(0, 0)
    let startItem = QueueItem(startPoint, nil, 0)
    cost[0][0][0] = 0
    cost[0][0][1] = 0
    queue.append(startItem)
    
    let di = [-1, 1, 0, 0]
    let dj = [0, 0, -1, 1]
    
    while idx < queue.count {
        let now = queue[idx]
        
        for k in 0..<4 {
            let nextI = now.point.i + di[k]
            let nextJ = now.point.j + dj[k]
            
            guard nextI >= 0 && nextJ >= 0 && nextI < N && nextJ < N else { continue }
            let nextPoint = Point(nextI, nextJ)
            if board[nextI][nextJ] == 0 {
                let (nextDir, isCorner) = checkDirectionAndCorner(now.point,
                                                                  nextPoint,
                                                                  prevDir: now.dir)
                let additionalCost = 100 + (isCorner ? 500 : 0)
                let nextSum = now.sum + additionalCost
                let dirIdx = (nextDir == .horizontal) ? 0 : 1
                if nextSum <= cost[nextI][nextJ][dirIdx] {
                    cost[nextI][nextJ][dirIdx] = nextSum
                    let nextQueueItem = QueueItem(nextPoint, nextDir, nextSum)
                    queue.append(nextQueueItem)
                }
            }
        }
        
        idx += 1
    }
    
    return min(cost[N-1][N-1][0], cost[N-1][N-1][1])
}