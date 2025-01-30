import Foundation

struct Point {
    let i: Int
    let j: Int
    
    init(_ i: Int, _ j: Int) {
        self.i = i
        self.j = j
    }
}

func solution(_ maps:[String]) -> Int {
    let di = [-1, 1, 0, 0]
    let dj = [0, 0, -1, 1]
    let ROW_COUNT = maps.count
    let COL_COUNT = maps[0].count
    let maps = maps.map { $0.map { String($0) } }
    
    func bfs(_ start: Point, _ target: String) -> Int {
        var idx = 0
        var queue = [(point: Point, count: Int)]()
        var visited = Array(repeating: Array(repeating: false, count: COL_COUNT), count: ROW_COUNT)
        
        queue.append((start, 0))
        visited[start.i][start.j] = true
        while idx < queue.count {
            let now = queue[idx]
            if maps[now.point.i][now.point.j] == target {
                return now.count
            }
            
            for k in 0..<4 {
                let nextI = now.point.i + di[k]
                let nextJ = now.point.j + dj[k]
                guard (0..<ROW_COUNT) ~= nextI && (0..<COL_COUNT) ~= nextJ else { continue }
                
                if (maps[nextI][nextJ] != "X") && !visited[nextI][nextJ] {
                    let nextPoint = Point(nextI, nextJ)
                    visited[nextI][nextJ] = true
                    queue.append((nextPoint, now.count+1))
                }
            }
            
            idx += 1
        }
        
        return -1
    }
    
    var startPoint: Point!
    var leverPoint: Point!
    for i in 0..<ROW_COUNT {
        for j in 0..<COL_COUNT {
            if maps[i][j] == "S" {
                startPoint = Point(i, j)
            }  else if maps[i][j] == "L" {
                leverPoint = Point(i, j)
            }
        }
    }
    
    let timeToLever = bfs(startPoint, "L")
    let timeToEnd = bfs(leverPoint, "E")
    if timeToLever == -1 || timeToEnd == -1 {
        return -1
    } else {
        return timeToLever + timeToEnd
    }
}