import Foundation

let N = Int(readLine()!)!
var grid = [[String]]()
for _ in 0..<N {
    grid.append(readLine()!.map({ String($0) }))
}
//grid.forEach { print($0) }

struct Point {
    let i: Int
    let j: Int
    
    init(_ i: Int, _ j: Int) {
        self.i = i
        self.j = j
    }
}
func bfs(_ start: Point, _ color: String, isNormal: Bool = true) {
    var idx = 0
    var queue = [Point]()
    queue.append(start)
    
    let di = [-1, 1, 0, 0]
    let dj = [0, 0, -1, 1]
    
    while idx < queue.count {
        let now = queue[idx]
        
        for k in 0..<4 {
            let nextI = now.i + di[k]
            let nextJ = now.j + dj[k]
            guard nextI >= 0 && nextJ >= 0 && nextI < N && nextJ < N else { continue }
            if isNormal { // 일반
                if grid[nextI][nextJ] == color && !visited[nextI][nextJ] {
                    visited[nextI][nextJ] = true
                    queue.append(Point(nextI, nextJ))
                }
            } else { // 적록색약
                if color == "B" {
                    if grid[nextI][nextJ] == color && !visited[nextI][nextJ] {
                        visited[nextI][nextJ] = true
                        queue.append(Point(nextI, nextJ))
                    }
                } else {
                    if ["R", "G"].contains(grid[nextI][nextJ]) && !visited[nextI][nextJ] {
                        visited[nextI][nextJ] = true
                        queue.append(Point(nextI, nextJ))
                    }
                }
            }
        }
        
        idx += 1
    }
}

// 일반 사람
var rgb = [String: Int]() // 색샹별 구역 개수
var visited = Array(repeating: Array(repeating: false, count: N), count: N)
for i in 0..<N {
    for j in 0..<N {
        if !visited[i][j] {
            let start = Point(i, j)
            let color = grid[i][j]
            rgb[color, default: 0] += 1
            bfs(start, color)
        }
    }
}
let normalAnswer = rgb.values.reduce(0, +)

// 적록색약
rgb = [String: Int]()
visited = Array(repeating: Array(repeating: false, count: N), count: N)
for i in 0..<N {
    for j in 0..<N {
        if !visited[i][j] {
            let start = Point(i, j)
            let color = grid[i][j]
            rgb[color, default: 0] += 1
            bfs(start, color, isNormal: false)
        }
    }
}
let blindAnswer = rgb.values.reduce(0, +)

print(normalAnswer, blindAnswer)