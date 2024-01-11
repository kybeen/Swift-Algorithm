import Foundation

let n = Int(readLine()!)!
var cost = [[Int]]()
for _ in 0..<n {
    cost.append(readLine()!.split(separator: " ").map{ Int($0)! })
}

var result = Int.max
var visited = [Int]()

func dfs(_ depth: Int) {
    if depth == n {
        var temp = 0
        for k in 0..<n-1 {
            temp += cost[visited[k]][visited[k+1]]
        }
        // 출발지로 돌아오는 비용 더하기
        let goBackCost = cost[visited.last!][visited.first!]
        if goBackCost != 0 {
            temp += goBackCost
            result = min(result, temp)
            return
        } else {
            return
        }
    }
    
    for i in 0..<n {
        if !visited.contains(i) && cost[visited.last!][i] != 0 {
            visited.append(i)
            dfs(depth+1)
            visited.popLast()
        }
    }
}

for i in 0..<n {
    visited.append(i)
    dfs(1)
    visited.popLast()
}

print(result)