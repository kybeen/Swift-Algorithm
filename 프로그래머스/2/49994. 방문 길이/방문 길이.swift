import Foundation

/// 좌표
struct Point: Hashable {
    let i: Int
    let j: Int
    
    init(_ i: Int, _ j: Int) {
        self.i = i
        self.j = j
    }
}
/// 지나간 길 정보 타입
/// - from: 출발점
/// - to: 도착점
struct Path: Hashable {
    let from: Point
    let to: Point
    
    func reversed() -> Self {
        return Path(from: to, to: from)
    }
}

func solution(_ dirs:String) -> Int {
    var now = Point(0, 0)
    var result = Set<Path>()
    
    func addPath(_ movedPoint: Point) {
        let path = Path(from: now, to: movedPoint)
        // 방향이 반대인 path가 있는지 확인
        if !result.contains(path.reversed()) {
            result.insert(path)
        }
        now = movedPoint
    }
    
    for dir in dirs {
        var moved: Int
        switch dir {
        case "U":
            moved = now.i + 1
            guard (-5...5) ~= moved else { continue }
            let movedPoint = Point(moved, now.j)
            addPath(movedPoint)
        case "D":
            moved = now.i - 1
            guard (-5...5) ~= moved else { continue }
            let movedPoint = Point(moved, now.j)
            addPath(movedPoint)
        case "L":
            moved = now.j - 1
            guard (-5...5) ~= moved else { continue }
            let movedPoint = Point(now.i, moved)
            addPath(movedPoint)
        case "R":
            moved = now.j + 1
            guard (-5...5) ~= moved else { continue }
            let movedPoint = Point(now.i, moved)
            addPath(movedPoint)
        default:
            break
        }
    }
    
    return result.count
}