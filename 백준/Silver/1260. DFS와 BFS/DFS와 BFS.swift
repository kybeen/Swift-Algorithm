import Foundation

let nums = readLine()!.split(separator: " ").map { Int($0)! }
let N = nums[0]
let M = nums[1]
let V = nums[2]
var nodes = [[Int]](repeating: [Int](), count: N+1)
for _ in 0..<M {
    let link = readLine()!.split(separator: " ").map { Int($0)! }
    let a = link[0]
    let b = link[1]
    nodes[a].append(b)
    nodes[b].append(a)
}
// 작은 수부터 찾기 위해 연결 노드 정렬
for i in 0..<nodes.count {
    nodes[i].sort()
}

func dfs(_ now: Int) {
    print(now, terminator: " ")
    visited[now] = true
    
    for n in nodes[now] {
        if !visited[n] {
            dfs(n)
        }
    }
}


func bfs(_ start: Int) {
    var queue = [Int]()
    queue.append(start)
    visited[start] = true
    
    while !queue.isEmpty {
        let now = queue.removeFirst()
        print(now, terminator: " ")
        for n in nodes[now] {
            if !visited[n] {
                visited[n] = true
                queue.append(n)
            }
        }
    }
}

var visited = [Bool](repeating: false, count: N+1)
dfs(V)
print()
visited = [Bool](repeating: false, count: N+1)
bfs(V)