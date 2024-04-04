import Foundation

let T = Int(readLine()!)!
for _ in 0..<T {
    let MNK = readLine()!.split(separator: " ").map { Int($0)! }
    let M = MNK[0] // 가로
    let N = MNK[1] // 세로
    
    var cabbage = Array(repeating: Array(repeating: 0, count: M), count: N)
    // 배추위치
    for _ in 0..<MNK[2] {
        let ji = readLine()!.split(separator: " ").map { Int($0)! }
        let j = ji[0]
        let i = ji[1]
        cabbage[i][j] = 1
    }
    
    let di = [-1, 1, 0, 0]
    let dj = [0, 0, -1, 1]
    var visited = Array(repeating: Array(repeating: false, count: M), count: N)
    
    func bfs(_ i: Int, _ j: Int) {
        var idx = 0
        var queue = [(Int, Int)]()
        
        visited[i][j] = true
        queue.append((i, j))
        while idx < queue.count {
            let now = queue[idx]
            
            for k in 0..<4 {
                let new_i = now.0 + di[k]
                let new_j = now.1 + dj[k]
                
                if new_i < 0 || new_j < 0 || new_i >= N || new_j >= M {
                    continue
                }
                if !visited[new_i][new_j] && cabbage[new_i][new_j] == 1 {
                    visited[new_i][new_j] = true
                    queue.append((new_i, new_j))
                }
            }
            
            idx += 1
        }
    }
    
    var result = 0
    for i in 0..<N {
        for j in 0..<M {
            // 배추가 있는 곳에서 BFS 시작 && 지렁이 수 1 증가
            if !visited[i][j] && cabbage[i][j] == 1 {
                result += 1
                bfs(i, j)
            }
        }
    }
    
    print(result)
}