import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var nodes = [[Int]](repeating: [Int](), count: n)
    var visited = [Bool](repeating: false, count: n)
    var result = 0
    
    // 노드 연결 관계 만들기
    for i in 0..<n {
        for j in 0..<n {
            if i != j && computers[i][j] == 1 {
                nodes[i].append(j)
            }
        }
    }
    
    // DFS 수행하며 방문처리
    func dfs(_ now: Int) {
        for node in nodes[now] {
            if !visited[node] {
                visited[node] = true
                dfs(node)
            }
        }
    }
    
    // 방문하지 않은 노드를 발견하면 네트워크 개수 1 카운트하고, DFS 시작
    for i in 0..<n {
        if !visited[i] {
            result += 1
            dfs(i)
        }
    }
    
    return result
}



// import Foundation

// func solution(_ n:Int, _ computers:[[Int]]) -> Int {
//     var visited: [Bool] = Array(repeating: false, count: n)
//     var result = 0
    
//     func dfs(_ now: Int) {
//         visited[now] = true
        
//         for i in 0..<n {
//             if (computers[now][i] == 1) && !visited[i] {
//                 dfs(i)
//             }
//         }
//     }
    
//     for i in 0..<n {
//         if !visited[i] {
//             result += 1
//             dfs(i)
//         }
//     }
    
//     return result
// }

















