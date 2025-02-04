typealias Point = (x: Int, y: Int)

func manhattanDistance(_ p1: Point, _ p2: Point) -> Int {
    return abs(p1.x - p2.x) + abs(p1.y - p2.y)
}

let N = Int(readLine()!)!
let se = readLine()!.split(separator: " ").map { Int($0)! }
let start = Point(se[0], se[1])
let destination = Point(se[2], se[3])

var shortestDistance = Int.max
var OEM = 0

for i in 0..<N {
    var now: Point = start
    var totalDistance = 0
    
    let M = Int(readLine()!)!
    for _ in 0..<M {
        let stopover = readLine()!.split(separator: " ").map { Int($0)! }
        let stopoverPoint = Point(stopover[0], stopover[1])
        
        totalDistance += manhattanDistance(now, stopoverPoint)
        now = stopoverPoint
    }
    
    totalDistance += manhattanDistance(now, destination)
    if totalDistance < shortestDistance {
        shortestDistance = totalDistance
        OEM = i + 1
    }
}

print(OEM)