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

var visited = [Bool](repeating: false, count: N+1)
var result = [Int](repeating: -1, count: N+1) // 부모 노드 번호를 저장할 배열
func dfs(_ now: Int) {
    for child in tree[now] {
        if !visited[child] {
            visited[child] = true
            result[child] = now
            dfs(child)
        }
    }
}
dfs(1)

for i in 2...N {
    print(result[i])
}