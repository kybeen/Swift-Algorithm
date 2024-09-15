import Foundation

struct MoveInfo {
    let point: Point
    let moveCount: Int
}

struct Point: Equatable {
    let r: Int
    let c: Int
}

let N = Int(readLine()!)!
let inputPoints = readLine()!.split(separator: " ").map({ Int($0) })
let rc1Point = Point(r: inputPoints[0]!, c: inputPoints[1]!)
let rc2Point = Point(r: inputPoints[2]!, c: inputPoints[3]!)

var visited = Array(repeating: Array(repeating: false, count: N), count: N)
var queue = [MoveInfo]()

let startInfo = MoveInfo(point: rc1Point, moveCount: 0)
visited[rc1Point.r][rc1Point.c] = true
queue.append(startInfo)

let offsetR = [-2, -2, 0, 2, 2, 0]
let offsetC = [-1, 1, 2, 1, -1, -2]

while !queue.isEmpty {
    let now = queue.removeFirst()
    if now.point == rc2Point {
        print(now.moveCount)
        exit(0)
    }
    
    for idx in 0..<6 {
        let newR = now.point.r + offsetR[idx]
        let newC = now.point.c + offsetC[idx]
        guard (0...N-1 ~= newR) && (0...N-1 ~= newC) else { continue }
        guard !visited[newR][newC] else { continue }
        
        visited[newR][newC] = true
        let newMoveInfo = MoveInfo(
            point: Point(r: newR, c: newC),
            moveCount: now.moveCount+1
        )
        queue.append(newMoveInfo)
    }
}

print(-1)