// 임의의 한 노드에서 가장 멀리 떨어진 노드는 트리의 지름에 포함된다.
// 그 노드에서 가장 멀리 떨어진 노드와의 거리가 트리의 지름에 해당함
import Foundation

let n = Int(readLine()!)!
var nodes = [[(Int, Int)]](repeating: [(Int, Int)](), count: n+1) // (연결된 노드 번호, 간선의 가중치)
for _ in 0..<n-1 {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let parent = input[0]
    let child = input[1]
    let cost = input[2]
    
    nodes[parent].append((child, cost))
    nodes[child].append((parent, cost))
}

var visited = [Bool](repeating: false, count: n+1)
var maxDist = 0 // 탐색을 시작한 노드로부터 가장 멀리 떨어진 거리 (루트 노드와 가장 멀리 떨어진 거리와 지름 구하기에 모두 사용)
var nodeInCircle = 0 // 지름에 포함되는 노드

func dfs(_ now: Int, _ totalCost: Int) {
    for node in nodes[now] {
        let child = node.0
        let cost = node.1
        if !visited[child] {
            visited[child] = true
            dfs(child, totalCost+cost)
            visited[child] = false
        }
    }
    
    if totalCost > maxDist {
        maxDist = totalCost // 최대 거리 갱신
        nodeInCircle = now
    }
}

// 루트 노드(1)과 가장 멀리 떨어진 노드 구하기
visited[1] = true
dfs(1, 0)
visited[1] = false

// 지름에 포함되는 노드에서 가장 멀리 떨어진 노드 구하기 (지름 구하기)
visited[nodeInCircle] = true
dfs(nodeInCircle, 0)
visited[nodeInCircle] = false

print(maxDist)
