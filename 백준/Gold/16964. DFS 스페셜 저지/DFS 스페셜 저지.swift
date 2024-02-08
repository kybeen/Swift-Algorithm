import Foundation

let N = Int(readLine()!)!
var tree = [[Int]](repeating: [Int](), count: N+1)
for _ in 0..<N-1 {
    let ab = readLine()!.split(separator: " ").map { Int($0)! }
    let a = ab[0]
    let b = ab[1]
    tree[a].append(b)
    tree[b].append(a)
}
var visitOrder = readLine()!.split(separator: " ").map { Int($0)! }

// visitOrder에 맞게 방문 우선순위 부여
var priority = [Int](repeating: -1, count: N+1)
for i in 0..<N {
    priority[visitOrder[i]] = i+1
}
// 우선순위에 맞게 tree의 인접 노드들 정렬
for i in 1...N {
    tree[i].sort { priority[$0] < priority[$1] }
}

var visited = [Bool](repeating: false, count: N+1)
var idx = -1

func dfs(_ now: Int) {
    idx += 1
    guard now == visitOrder[idx] else {
        print(0)
        exit(0)
    }
    
    for node in tree[now] {
        if !visited[node] {
            visited[node] = true
            dfs(node)
        }
    }
}

visited[1] = true
dfs(1)
print(1)