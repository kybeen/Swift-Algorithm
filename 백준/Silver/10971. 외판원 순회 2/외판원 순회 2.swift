import Foundation

let n = Int(readLine()!)!
var cost = [[Int]]()
for _ in 0..<n {
    cost.append(readLine()!.split(separator: " ").map{ Int($0)! })
}

var result = Int.max
var visited = [Int]()

// depth: 방문지 개수, sum: 여행 비용, now: 현재 위치
func dfs(_ depth: Int, _ sum: Int) {
    // 현재까지 비용이 result 이상이면 더 탐색할 필요 X
    if sum >= result { return }
    
    if depth == n {
        let last = visited.last!
        let first = visited.first!
        // 출발지로 돌아갈 수 있는 경우라면 돌아가는 비용까지 계산 후 결과에 반영
        if cost[last][first] == 0 { return }
        result = min(result, sum+cost[last][first])
        return
    }
    
    for i in 0..<n {
        // 방문하지 않았고 현재 위치에서 갈 수 있는 곳이라면
        let last = visited.last!
        if !visited.contains(i) && cost[last][i] != 0 {
            visited.append(i)
            dfs(depth+1, sum+cost[last][i])
            visited.popLast()
        }
    }
}

for i in 0..<n {
    visited.append(i)
    dfs(1, 0)
    visited.popLast()
}

print(result)