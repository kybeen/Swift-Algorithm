import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let N = nm[0]
let M = nm[1]
var nodes = [[Int]](repeating: [Int](), count: N+1)
for _ in 0..<M {
    let ab = readLine()!.split(separator: " ").map { Int($0)! }
    let a = ab[0]
    let b = ab[1]
    nodes[a].append(b)
    nodes[b].append(a)
}

func dfs(_ now: Int) {
    visited[now] = true
    
    for n in nodes[now] {
        if !visited[n] {
            dfs(n)
        }
    }
}

var visited = [Bool](repeating: false, count: N+1)
visited[0] = true
var result = 0
for i in 1...N {
    if !visited[i] {
        result += 1
        dfs(i)
    }
}
print(result)