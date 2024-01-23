import Foundation

let K = Int(readLine()!)!
// 테스트케이스
for _ in 0..<K {
    let VE = readLine()!.split(separator: " ").map { Int($0)! }
    let V = VE[0] // 정점 개수
    let E = VE[1] // 간선 개수
    var nodes = [[Int]](repeating: [Int](), count: V+1)
    for _ in 0..<E {
        let ab = readLine()!.split(separator: " ").map { Int($0)! }
        let a = ab[0]
        let b = ab[1]
        nodes[a].append(b)
        nodes[b].append(a)
    }
    
    func dfs(_ now: Int, _ nowColor: Int) {
        guard result == true else { return }
        
        visited[now] = nowColor
        
        for n in nodes[now] {
            if visited[n] == 0 {
                dfs(n, -nowColor)
            } else if visited[n] == nowColor { // 인접 노드와 같은 색인 경우가 있으면 이분 그래프가 아님
                result = false
                return
            }
        }
    }
    
    var visited = [Int](repeating: 0, count: V+1) // 0: 방문안함, 1: 빨간색, -1: 파란색
    var result = true
    
    for i in 1...V {
        guard result == true else { break }
        
        if visited[i] == 0 {
            dfs(i, 1)
        }
    }
    print(result ? "YES" : "NO")
}