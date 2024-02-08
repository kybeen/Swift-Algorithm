import Foundation

let N = Int(readLine()!)!
var zido = [[Int]]()
for _ in 0..<N {
    zido.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var edges = [[(Int, Int)]]() // 각 섬의 테두리에 해당하는 좌표들을 저장 ex) edges[0]: 0번 섬의 테두리 좌표

var visited = [[Bool]](repeating: [Bool](repeating: false, count: N), count: N)

func bfs(_ start: (Int, Int), _ isLandIdx: Int) {
    let di = [-1, 1, 0, 0]
    let dj = [0, 0, -1, 1]
    
    var idx = 0
    var queue = [(Int, Int)]()
    
    queue.append((start.0, start.1))
    visited[start.0][start.1] = true
    
    while idx < queue.count {
        let now = queue[idx]
        var isEdge = false
        
        for k in 0..<4 {
            let new_i = now.0 + di[k]
            let new_j = now.1 + dj[k]
            
            if new_i < 0 || new_j < 0 || new_i >= N || new_j >= N {
                continue
            }
            if zido[new_i][new_j] == 1 {
                if !visited[new_i][new_j] {
                    queue.append((new_i, new_j))
                    visited[new_i][new_j] = true
                }
            } else {
                // 바다랑 인접해있는 곳은 섬의 테두리에 해당함
                isEdge = true
            }
        }
        
        // 각 섬의 테두리에 해당하는 좌표를 edges에 저장
        if isEdge {
            edges[isLandIdx].append(now)
        }
        
        idx += 1
    }
}

var isLandIdx = 0 // 섬 인덱스 번호
for i in 0..<N {
    for j in 0..<N {
        if zido[i][j] == 1 && !visited[i][j] {
            edges.append([])
            bfs((i, j), isLandIdx)
            isLandIdx += 1
        }
    }
}

// 각 섬의 테두리 점들 간의 거리를 비교해서 최솟값 확인
var shortest = Int.max
for i in 0..<edges.count-1 {
    for j in i+1..<edges.count {
        for edgeA in edges[i] {
            for edgeB in edges[j] {
                let dist = abs(edgeA.0 - edgeB.0) + abs(edgeA.1 - edgeB.1) - 1
                shortest = min(shortest, dist)
            }
        }
    }
}

print(shortest)