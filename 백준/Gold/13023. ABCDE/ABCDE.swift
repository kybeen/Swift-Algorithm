import Foundation

let nums = readLine()!.split(separator: " ").map { Int($0)! }
let N = nums[0]
let M = nums[1]
var relationship = [[Int]](repeating: [Int](), count:N)
for _ in 0..<M {
    let ab = readLine()!.split(separator: " ").map { Int($0)! }
    let a = ab[0]
    let b = ab[1]
    relationship[a].append(b)
    relationship[b].append(a)
}

var visited = [Bool](repeating: false, count: N)
var result = 0

func dfs(_ depth: Int, _ now: Int) {
    guard result == 0 else { return }
    
    // 5개 노드까지 확인되면 연속된 노드가 존재하는 것임
    if depth == 5 {
        result = 1
        return
    }
    
    for r in relationship[now] {
        if !visited[r] {
            visited[r] = true
            dfs(depth+1, r)
            visited[r] = false
        }
    }
}

for i in 0..<N {
    guard result == 0 else { continue }

    visited[i] = true
    dfs(1, i)
    visited[i] = false
}

print(result)