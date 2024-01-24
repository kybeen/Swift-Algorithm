import Foundation

let N = Int(readLine()!)!
var houseMap = [[Int]]()
for _ in 0..<N {
    houseMap.append(Array(readLine()!).map { Int(String($0))! })
}

var visited = [[Bool]](repeating: [Bool](repeating: false, count: N), count: N)
var result = [Int]() // 단지내 집의 수

func bfs(_ start: (Int, Int)) {
    var count = 0
    let di = [-1, 1, 0, 0]
    let dj = [0, 0, -1, 1]
    
    var queue = [(Int, Int)]()
    queue.append(start)
    visited[start.0][start.1] = true
    
    while !queue.isEmpty {
        count += 1 // 단지 내 집의 개수 세기
        let now = queue.removeFirst()
        let i = now.0
        let j = now.1
        for k in 0..<4 {
            let newI = i + di[k]
            let newJ = j + dj[k]
            if newI < 0 || newI >= N || newJ < 0 || newJ >= N {
                continue
            }
            if !visited[newI][newJ] && houseMap[newI][newJ] != 0 {
                queue.append((newI, newJ))
                visited[newI][newJ] = true
            }
        }
    }
    
    result.append(count)
}

for i in 0..<N {
    for j in 0..<N {
        // 방문 처리가 되지 않은 집을 발견하면 bfs 시작
        if houseMap[i][j] != 0 && !visited[i][j] {
            bfs((i,j))
        }
    }
}

print(result.count)
for r in result.sorted() {
    print(r)
}