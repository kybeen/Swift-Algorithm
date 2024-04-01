import Foundation

let NMV = readLine()!.split(separator: " ").map { Int($0)! }
let N = NMV[0]
let M = NMV[1]
let V = NMV[2]
var nodes = Array(repeating: [Int](), count: N+1)
for _ in 0..<M {
    let ab = readLine()!.split(separator: " ").map { Int($0)! }
    let a = ab[0]
    let b = ab[1]
    nodes[a].append(b)
    nodes[b].append(a)
}
for i in 1...N {
    nodes[i].sort(by: <)
}

var visited = [Bool](repeating: false, count: N+1)
var dfsResult = ""
var bfsResult = ""
func dfs(_ now: Int) {
    visited[now] = true
    dfsResult += "\(now) "
    
    for node in nodes[now] {
        if !visited[node] {
            dfs(node)
        }
    }
}

func bfs(_ start: Int) {
    visited = [Bool](repeating: false, count: N+1)
    
    var idx = 0
    var queue = [Int]()
    
    visited[start] = true
    queue.append(start)
    
    while idx < queue.count {
        let now = queue[idx]
        bfsResult += "\(now) "
        
        for node in nodes[now] {
            if !visited[node] {
                visited[node] = true
                queue.append(node)
            }
        }
        
        idx += 1
    }
}

dfs(V)
bfs(V)
print(dfsResult)
print(bfsResult)