let N = Int(readLine()!)!
let M = Int(readLine()!)!
var nodes = Array(repeating: [Int](), count: N)
for nowTown in 0..<N {
    let connections = readLine()!.split(separator: " ").map({ Int($0)! })
    for (otherTown, connected) in connections.enumerated() {
        if connected == 1 {
            nodes[nowTown].append(otherTown)
        }
    }
}

// 각 여행지마다 갈 수 있는지 여부를 체크
var possible = Array(repeating: Array(repeating: false, count: N), count: N) // [i][j]: i에서 j로 방문이 가능한지
func checkVisitable(_ now: Int, _ start: Int, _ depth: Int, _ visited: inout [Bool]) {
    visited[now] = true
    possible[start][now] = true
    
    for node in nodes[now] {
        if !visited[node] {
            checkVisitable(node, start, depth+1, &visited)
        }
    }
}
for i in 0..<N {
    var visited = Array(repeating: false, count: N)
    checkVisitable(i, i, 1, &visited)
}

// 여행 경로 확인
var plans = readLine()!.split(separator: " ").map({ Int($0)! })
var answer = false
func travel(_ nowPlanIdx: Int) {
    if nowPlanIdx == plans.count - 1 {
        answer = true
        return
    }
    
    let now = plans[nowPlanIdx] - 1
    let next = plans[nowPlanIdx+1] - 1
    if possible[now][next] {
        travel(nowPlanIdx + 1)
    }
}
travel(0)

print(answer ? "YES" : "NO")