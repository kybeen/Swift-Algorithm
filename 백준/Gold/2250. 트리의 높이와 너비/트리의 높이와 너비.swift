/*
 - 루트 노드 -> 자식 노드로 언급되지 않은 노드
 - 루트 노드부터 DFS 중위 순회 -> 순서대로 왼쪽에 들어감
 - depth를 같이 계산해서 tree 배열에 넣어준다.
 */
import Foundation

let N = Int(readLine()!)!
var nodes = [Int: [Int]]() // 노드의 연결 관계
var tree = [[Int]](repeating: [Int](repeating: -1, count: N+1), count: 10_000) // 노드 개수가 1~10,000개이기 때문에 가능한 최대 깊이는 9,999

var isRoot = [Bool](repeating: true, count: N+1)
isRoot[0] = false

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let parent = input[0]
    let left = input[1]
    let right = input[2]
    
    if left != -1 {
        isRoot[left] = false
    }
    if right != -1 {
        isRoot[right] = false
    }
    nodes[parent] = [left, right]
}

let root = isRoot.firstIndex(of: true)! // 루트노드
var colIdx = 1 // 열 인덱스
var maxDepth = 0 // 최대 깊이

// 중위 순회
func dfs(_ depth: Int, _ now: Int) {
    let left = nodes[now]![0]
    let right = nodes[now]![1]
    maxDepth = max(maxDepth, depth)
    
    if left != -1 {
        dfs(depth+1, left)
    }
    
    tree[depth][colIdx] = now // 중위 순회 방문 순서대로 왼쪽부터 해당 depth에 맞게 채워준다.
    colIdx += 1
    
    if right != -1 {
        dfs(depth+1, right)
    }
}
dfs(1, root)

var result: (Int, Int) = (Int.max, 0)
for depth in 1...maxDepth {
    var left = 0
    var right = N
    // 해당 depth의 가장 왼쪽 노드 인덱스
    for leftIdx in 1...N {
        if tree[depth][leftIdx] != -1 {
            left = leftIdx
            break
        }
    }
    // 해당 depth의 가장 오른쪽 노드 인덱스
    for rightIdx in stride(from: N, through: 1, by: -1) {
        if tree[depth][rightIdx] != -1 {
            right = rightIdx
            break
        }
    }
    
    let width = right - left + 1
    if result.1 < width {
        result = (depth, width)
    } else if result.1 == width {
        result = (min(result.0, depth), width)
    }
}
print(result.0, result.1, separator: " ")