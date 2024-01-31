// 임의의 노드에 대해 가장 멀리 있는 노드는 트리의 지름에 포함되는 노드임 👉 그 노드에서부터 가장 깊은 곳까지 탐색하면 트리의 지름이 된다.
import Foundation

let V = Int(readLine()!)!
var tree = [[(Int, Int)]](repeating: [(Int, Int)](), count: V+1) // (연결된 노드, 노드와의 거리)

var leaves = [Int]() // 가장 말단에 위치한 노드들 (정점이 1개)
for _ in 0..<V {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let node = input[0]
    // 홀수 인덱스 : -1 아니면 연결 노드
    // 짝수 인덱스 : 0번은 현재 노드, 나머지는 연결된 노드와의 거리
    for i in stride(from: 1, to: input.count, by:2) {
        if input[i] != -1 {
            let linkedNode = input[i] // 연결된 노드
            let distance = input[i+1] // 노드와의 거리
            tree[node].append((linkedNode, distance))
        }
    }
    if input.count == 4 {
        leaves.append(input[0])
    }
}

var result = 0
var start = 0
var visited = [Bool](repeating: false, count: V+1)
func dfs(_ now: Int, _ distance: Int) {
    if distance > result {
        start = now
    }
    result = max(result, distance)
    
    for node in tree[now] {
        if !visited[node.0] {
            visited[node.0] = true
            dfs(node.0, distance+node.1)
            visited[node.0] = false
        }
    }
}
// 임의의 노드에 대해 가장 멀리 떨어진 노드 구하기 (임의의 노드는 리프 노드 중 하나로 고름 - 아무 노드로 해도 상관은 없을 듯하다)
visited[leaves[0]] = true
dfs(leaves[0], 0)
visited[leaves[0]] = false

// 지름 구하기
visited = [Bool](repeating: false, count: V+1)
visited[start] = true
dfs(start, 0)
visited[start] = false

print(result)