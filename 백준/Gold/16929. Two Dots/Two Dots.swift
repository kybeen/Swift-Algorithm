import Foundation

let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0]
let M = NM[1]
var dots = [[Character]]()
for _ in 0..<N {
    dots.append(Array(readLine()!))
}
var isCycle = false

var visited = [[Int]](repeating: [Int](repeating: 0, count: M), count: N)
let di = [-1, 1, 0, 0]
let dj = [0, 0, -1, 1]

// 시작 점과 인접한 점인지 체크하는 함수
func checkCycle(_ start: (Int, Int), _ now: (Int, Int)) -> Bool {
    for k in 0..<4 {
        let check_i = now.0 + di[k]
        let check_j = now.1 + dj[k]
        if (check_i, check_j) == start {
            return true
        }
    }
    return false
}

func dfs(_ start: (Int, Int), _ now: (Int, Int), _ depth: Int) {
    guard !isCycle else { return }
    
    // 사이클 확인 👉 depth가 4 이상일 때 사이클 여부를 확인한다.
    if depth >= 4 {
        // 현재 점이 시작점과 인접한 점이라면 사이클임
        if checkCycle(start, now) {
            isCycle = true
            return
        }
    }
    
    for k in 0..<4 {
        let new_i = now.0 + di[k]
        let new_j = now.1 + dj[k]
        
        if new_i < 0 || new_i >= N || new_j < 0 || new_j >= M {
            continue
        }
        // 인접한 점 중에서 아직 방문하지 않았고 같은 색인 점이 있다면 dfs 탐색
        if (visited[new_i][new_j] == 0) && (dots[new_i][new_j] == dots[start.0][start.1]) {
            visited[new_i][new_j] = 1
            dfs(start, (new_i, new_j), depth+1)
            visited[new_i][new_j] = 0
        }
    }
}

totalLoop: for i in 0..<N {
    for j in 0..<M {
        guard !isCycle else { break totalLoop }
        visited[i][j] = 1
        dfs((i, j), (i, j), 1)
        visited[i][j] = 0
    }
}

print(isCycle ? "Yes" : "No")