// 한 지점에 여러 번 방문 시 무한루프 걸릴 수 있음
import Foundation

let di = [-2, -1, 1, 2, 2, 1, -1, -2]
let dj = [1, 2, 2, 1, -1, -2, -2, -1]

let t = Int(readLine()!)!
for _ in 0..<t {
    let size = Int(readLine()!)! // 체스판 한 변의 길이
    let start = readLine()!.split(separator: " ").map { Int($0)! }
    let destination = readLine()!.split(separator: " ").map { Int($0)! }
    var result = 0
    
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: size), count: size)
    var queue = [(Int, Int, Int)]() // (i좌표, j좌표, 이동 횟수)
    var idx = 0
    
    queue.append((start[0], start[1], 0))
     
    while idx < queue.count {
        let now = queue[idx]
        if now.0 == destination[0] && now.1 == destination[1] {
            result = now.2
            break
        }
        
        for k in 0..<8 {
            let new_i = now.0 + di[k]
            let new_j = now.1 + dj[k]
            if new_i < 0 || new_i >= size || new_j < 0 || new_j >= size {
                continue
            }
            if !visited[new_i][new_j] {
                queue.append((new_i, new_j, now.2+1))
                visited[new_i][new_j] = true
            }
        }
        
        idx += 1
    }
    
    print(result)
}