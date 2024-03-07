import Foundation

let NMK = readLine()!.split(separator: " ").map { Int($0)! }
let N = NMK[0]
let M = NMK[1]
let K = NMK[2]
var grid = [[Int]]()

for _ in 0..<N {
    grid.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var result = Int.min // 격자판에 들어가는 수의 범위 생각해야 함
var visited = Array(repeating: Array(repeating: false, count: M), count: N)

let di = [-1, 1, 0, 0]
let dj = [0, 0, -1, 1]

// 인접한 칸 중 선택된 칸이 있는지 확인하는 함수
func checkInjeob(_ i: Int, _ j: Int) -> Bool {
    var isInjeob = false
    
    for k in 0..<4 {
        let new_i = i + di[k]
        let new_j = j + dj[k]
        
        if new_i < 0 || new_j < 0 || new_i >= N || new_j >= M { continue }
        
        // 인접한 칸 중 선택된 칸이 있으면
        if visited[new_i][new_j] {
            isInjeob = true
            break
        }
    }
    
    return isInjeob
}

func dfs(_ now: (i: Int, j: Int), _ depth: Int, _ sum: Int) {
    if depth == K {
        result = max(result, sum)
        return
    }
    
    for i in now.i..<N {
        // 이전에 방문한 행과 현재 탐색하는 행이 같다면 이전에 방문한 열 이후부터 탐색
        // 현재 탐색하는 행이 이전에 방문한 행과 다르다면(이후의 행이라면) 0번 열부터 탐색
        let jStart = (i == now.i ? now.j+1 : 0)
        for j in jStart..<M { // 이전에 방문한 열의
            // 방문하지 않았고, 인접한 노드 중 선택된 노드가 없다면
            if !visited[i][j] && !checkInjeob(i, j){
                visited[i][j] = true
                dfs((i, j), depth+1, sum+grid[i][j])
                visited[i][j] = false
            }
        }
    }
}

dfs((0, -1), 0, 0)
print(result)