import Foundation

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    let dungeonCount = dungeons.count
    var visited = Array(repeating: false, count: dungeonCount)
    var result = 0
    
    func dfs(_ energy: Int, _ depth: Int) {
        result = max(result, depth)
        guard depth < dungeonCount else { return }
        
        for next in 0..<dungeonCount {
            let nextNeed = dungeons[next][0]
            let nextUse = dungeons[next][1]
            
            if !visited[next] && energy >= nextNeed {
                visited[next] = true
                dfs(energy-nextUse, depth+1)
                visited[next] = false
            }
        }
    }
    
    dfs(k, 0)
    
    return result
}