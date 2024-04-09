import Foundation

let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0]
let M = NM[1]
var nodes = Array(repeating: [Int](), count: N+1)
for _ in 0..<M {
    let uv = readLine()!.split(separator: " ").map { Int($0)! }
    let u = uv[0]
    let v = uv[1]
    nodes[u].append(v)
    nodes[v].append(u)
}
var visited = [Bool](repeating: false, count: N+1)

func dfs(_ now: Int) {
    visited[now] = true
    
    for node in nodes[now] {
        if !visited[node] {
            dfs(node)
        }
    }
}

var result = 0
for i in 1...N {
    if !visited[i] {
        result += 1
        dfs(i)
    }
}
print(result)