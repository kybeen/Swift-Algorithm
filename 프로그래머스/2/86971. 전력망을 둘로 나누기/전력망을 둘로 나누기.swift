// import Foundation

// var nodes = [[Int]]() // 인접 리스트
// var visited = [Bool]() // 방문 체크
// var trees = [Int]() // 각 트리의 노드 개수를 저장할 배열
// var idx: Int = 0 // 현재 트리의 인덱스

// // dfs 메서드
// func dfs(_ now: Int) {
//     visited[now] = true
//     trees[idx] += 1

//     for node in nodes[now] {
//         if !visited[node] {
//             dfs(node)
//         }
//     }
// }

// func solution(_ n:Int, _ wires:[[Int]]) -> Int {
//     var result = Int.max
    
//     // wire를 하나씩 빼보며 각 경우를 확인
//     nowLoop: for removedWire in 0..<n-1 {
//         // 인접 리스트 생성
//         nodes = [[Int]](repeating: [Int](), count: n+1)
//         for i in 0..<n-1 {
//             if i != removedWire {
//                 nodes[wires[i][0]].append(wires[i][1])
//                 nodes[wires[i][1]].append(wires[i][0])
//             }
//         }
        
//         visited = [Bool](repeating: false, count: n+1)
//         trees = [Int]()
//         idx = 0
//         // 방문하지 않은 노드가 있다면 해당 트리 탐색
//         for i in 1...n {
//             if !visited[i] {
//                 trees.append(0)
//                 if trees.count > 2 { break nowLoop } // 트리가 2개보다 많아지면 현재 케이스 반복문을 바로 종료
//                 dfs(i)
//                 idx += 1
//             }
//         }
        
//         // 트리가 2개인 케이스 확인이 끝나면 노드 개수 차이 구하기
//         result = min(result, abs(trees[0] - trees[1]))
//     }
    
//     return result
// }

import Foundation

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    var tree = Array(repeating: [Int](), count: n+1)
    var result = Int.max
    
    // 트리 만들기
    for wire in wires {
        let a = wire[0]
        let b = wire[1]
        tree[a].append(b)
        tree[b].append(a)
    }
    
    var visited: [Bool] = []
    var tower = [0, 0] // 각 전력망의 송전탑 개수
    var exception: Set<Int>
    
    /// DFS
    func dfs(_ now: Int, _ towerIdx: Int) {
        tower[towerIdx] += 1
        
        for i in 0..<tree[now].count {
            let next = tree[now][i]
            if exception.contains(now) && exception.contains(next) {
                continue
            } else {
                if !visited[next] {
                    visited[next] = true
                    dfs(next, towerIdx)
                }
            }
        }
    }
    
    // 간선을 하나씩 끊어보며 확인
    for wire in wires {
        let a = wire[0]
        let b = wire[1]
        
        visited = Array(repeating: false, count: n+1)
        tower = [0, 0]
        exception = Set<Int>(wire)
        
        visited[a] = true
        visited[b] = true
        dfs(a, 0)
        dfs(b, 1)
        
        let diff = abs(tower[0] - tower[1])
        result = min(result, diff)
    }
    
    return result
}
















