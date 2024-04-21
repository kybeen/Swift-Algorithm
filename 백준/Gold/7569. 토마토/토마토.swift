import Foundation

let MNH = readLine()!.split(separator: " ").map { Int($0)! }
let M = MNH[0] // 가로
let N = MNH[1] // 세로
let H = MNH[2] // 높이

var tomatoes = [[[Int]]]() // 토마토
var floor = [[Int]]()
for k in 0..<N*H {
    floor.append(readLine()!.split(separator: " ").map { Int($0)! })
    if k % N == N-1 {
        tomatoes.append(floor)
        floor = [[Int]]()
    }
}

let dh = [-1, 1, 0, 0, 0, 0] // 높이
let di = [0, 0, -1, 1, 0, 0] // 세로
let dj = [0, 0, 0, 0, -1, 1] // 가로

var idx = 0
var queue = [(h:Int, i:Int, j:Int, day:Int)]()
var visited = Array(repeating: Array(repeating: Array(repeating: false, count: M), count: N), count: H)
var result = 0

// 시작점(익은 토마토) 찾기
for h in 0..<H {
    for i in 0..<N {
        for j in 0..<M {
            if tomatoes[h][i][j] == 1 {
                queue.append((h, i, j, 0))
                visited[h][i][j] = true
            }
        }
    }
}

while idx < queue.count {
    let now = queue[idx]
    result = now.day
    
    for k in 0..<6 {
        let new_h = now.h + dh[k]
        let new_i = now.i + di[k]
        let new_j = now.j + dj[k]
        
        if new_h < 0 || new_i < 0 || new_j < 0 || new_h >= H || new_i >= N || new_j >= M {
            continue
        }
        if !visited[new_h][new_i][new_j] && tomatoes[new_h][new_i][new_j] == 0 {
            queue.append((new_h, new_i, new_j, now.day+1))
            tomatoes[new_h][new_i][new_j] = 1
            visited[new_h][new_i][new_j] = true
        }
    }
    
    idx += 1
}

// 익지 않은 토마토가 남아 있으면 -1
check: for h in 0..<H {
    for i in 0..<N {
        for j in 0..<M {
            if tomatoes[h][i][j] == 0 {
                result = -1
                break check
            }
        }
    }
}
print(result)