import Foundation

let N = Int(readLine()!)!
var height = [[Int]]()
var minHeight = 100 // 가장 낮은 곳의 높이
var maxHeight = 2 // 가장 높은 곳의 높이
for _ in 0..<N {
    let row = readLine()!.split(separator: " ").map { Int($0)! }
    minHeight = min(minHeight, row.min()!)
    maxHeight = max(maxHeight, row.max()!)
    height.append(row)
}

var result = 1
// 비가 내리는 양마다 확인
for rain in minHeight...maxHeight {
    var visited = Array(repeating: Array(repeating: false, count :N), count: N)
    var safeArea = 0
    
    for i in 0..<N {
        for j in 0..<N {
            // 안전영역 구하기 (BFS)
            if !visited[i][j] && height[i][j] > rain {
                safeArea += 1
                var idx = 0
                var queue: [(i:Int, j:Int)] = [(i,j)]
                visited[i][j] = true
                
                let di = [-1, 1, 0, 0]
                let dj = [0, 0, -1, 1]
                
                while idx < queue.count {
                    let now = queue[idx]
                    
                    for k in 0..<4 {
                        let new_i = now.i + di[k]
                        let new_j = now.j + dj[k]
                        
                        if new_i < 0 || new_j < 0 || new_i >= N || new_j >= N {
                            continue
                        }
                        if !visited[new_i][new_j] && height[new_i][new_j] > rain {
                            queue.append((new_i, new_j))
                            visited[new_i][new_j] = true
                        }
                    }
                    
                    idx += 1
                }
            }
        }
    }
    
    result = max(result, safeArea)
}

print(result)