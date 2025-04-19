import Foundation

struct Point {
    let i: Int
    let j: Int
    
    init(_ i: Int, _ j: Int) {
        self.i = i
        self.j = j
    }
}

let NM = readLine()!.split(separator: " ").map({ Int($0)! })
let (N, M) = (NM[0], NM[1])
var space = [[Int]]()
for _ in 0..<N {
    space.append(readLine()!.split(separator: " ").map({ Int($0)! }))
}
//space.forEach { print($0) }

func getSafeDistance(_ start: Point) -> Int {
    let di = [-1, -1, 0, 1, 1, 1, 0, -1]
    let dj = [0, 1, 1, 1, 0, -1, -1, -1]
    var visited = Array(repeating: Array(repeating: false, count: M), count: N)
    
    var idx = 0
    var queue = [(now: Point, dist: Int)]()
    visited[start.i][start.j] = true
    queue.append((start, 0))
    
    while idx < queue.count {
        let (now, dist) = queue[idx]
        
        if space[now.i][now.j] == 1 {
            return dist
        }
        
        for k in 0..<8 {
            let nextI = now.i + di[k]
            let nextJ = now.j + dj[k]
            
            guard nextI >= 0 && nextJ >= 0 && nextI < N && nextJ < M else { continue }
            if !visited[nextI][nextJ] {
                visited[nextI][nextJ] = true
                queue.append((Point(nextI, nextJ), dist+1))
            }
        }
        
        idx += 1
    }
    
    return 0
}

var answer = 0
for i in 0..<N {
    for j in 0..<M {
        if space[i][j] == 0 {
            answer = max(answer, getSafeDistance(Point(i, j)))
        }
    }
}
print(answer)