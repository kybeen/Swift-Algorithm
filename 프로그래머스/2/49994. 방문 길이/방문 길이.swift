import Foundation

struct Point: Hashable {
    let i: Int
    let j: Int
    
    init(_ i: Int, _ j: Int) {
        self.i = i
        self.j = j
    }
}

struct Path: Hashable {
    let from: Point
    let to: Point
    
    init(_ from: Point, _ to: Point) {
        self.from = from
        self.to = to
    }
}

func solution(_ dirs:String) -> Int {
    var dirs = dirs.map { String($0) }
    var offset: [String: Point] = [
        "U": Point(-1,0),
        "D": Point(1,0),
        "L": Point(0,-1),
        "R": Point(0,1)
    ]
    
    var start = Point(0,0)
    var visited = Set<Path>()
    
    func isVisitedPath(_ path: Path) -> Bool {
        let reversed = Path(path.to, path.from)
        return visited.contains(path) || visited.contains(reversed)
    }
    
    for dir in dirs {
        let nextI = start.i + offset[dir]!.i
        let nextJ = start.j + offset[dir]!.j
        guard nextI >= -5 && nextJ >= -5 && nextI <= 5 && nextJ <= 5 else { continue }
        let next = Point(nextI, nextJ)
        let path = Path(start, next)
        start = next
        if !isVisitedPath(path) {
            visited.insert(path)
        }
    }
    
    return visited.count
}