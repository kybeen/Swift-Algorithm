import Foundation

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    var result = Int.max
    
    // wire를 하나씩 빼보며 각 경우를 확인
    for removedWire in 0..<n-1 {
        var nodes = [[Int]](repeating: [Int](), count: n+1)
        for i in 0..<n-1 {
            if i != removedWire {
                nodes[wires[i][0]].append(wires[i][1])
                nodes[wires[i][1]].append(wires[i][0])
            }
        }
        
        var visited = [Bool](repeating: false, count: n+1)
        var trees = [Int]() // 각 트리의 노드 개수를 저장할 배열
        var idx = 0 // 현재 트리의 인덱스
        
        // dfs 메서드
        func dfs(_ now: Int) {
            visited[now] = true
            trees[idx] += 1

            for node in nodes[now] {
                if !visited[node] {
                    dfs(node)
                }
            }
        }
        
        // 방문하지 않은 노드가 있다면 해당 트리 탐색
        nowLoop: for i in 1...n {
            if !visited[i] {
                trees.append(0)
                if trees.count > 2 { break nowLoop } // 트리가 2개보다 많아지면 현재 케이스 반복문을 바로 종료
                dfs(i)
                idx += 1
            }
        }
        result = min(result, abs(trees[0] - trees[1]))
    }
    

    
    return result
}