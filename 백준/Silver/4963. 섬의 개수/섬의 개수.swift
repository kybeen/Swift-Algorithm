import Foundation

// 대각선 방향까지 고려한 배열
let di = [-1, 1, 0, 0, 1, 1, -1, -1]
let dj = [0, 0, -1, 1, 1, -1, 1, -1]

while true {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let w = input[0]
    let h = input[1]
    // 종료 입력
    if w == 0 && h == 0 {
        break
    }
    
    var result = 0
    var map = [[Int]]()
    for _ in 0..<h {
        map.append(readLine()!.split(separator: " ").map { Int($0)! })
    }
    
    // 방문 체크 배열
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: w), count: h)
    
    func bfs(start: (Int, Int)) {
        var queue = [(Int, Int)]()
        queue.append(start)
        visited[start.0][start.1] = true
        
        while !queue.isEmpty {
            let now = queue.removeFirst()
            
            for k in 0..<8 {
                let new_i = now.0 + di[k]
                let new_j = now.1 + dj[k]
                
                if new_i < 0 || new_i >= h || new_j < 0 || new_j >= w {
                    continue
                }
                if !visited[new_i][new_j] && map[new_i][new_j] == 1 {
                    queue.append((new_i, new_j))
                    visited[new_i][new_j] = true
                }
            }
        }
    }
    
    for i in 0..<h {
        for j in 0..<w {
            // 방문하지 않았으면서 땅인 곳이 나오면 섬 개수 1 증가 후 BFS
            if !visited[i][j] && map[i][j] == 1 {
                result += 1
                bfs(start: (i, j))
            }
        }
    }
    print(result)
}