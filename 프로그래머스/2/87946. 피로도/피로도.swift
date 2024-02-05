import Foundation

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    let n = dungeons.count
    var visited = [Bool](repeating: false, count: n)
    var result = -1
    
    // rest: 잔여 피로도, depth: 탐험한 던전 수
    func dfs(_ rest: Int, _ depth: Int) {
        result = max(result, depth)
        
        for i in 0..<n {
            // 방문하지 않았고 잔여 피로도가 최소 필요 피로도 이상이면 던전 탐험
            if !visited[i] && dungeons[i][0] <= rest {
                visited[i] = true
                dfs(rest - dungeons[i][1], depth+1)
                visited[i] = false
            }
        }
    }
    
    dfs(k, 0)
    
    return result
}