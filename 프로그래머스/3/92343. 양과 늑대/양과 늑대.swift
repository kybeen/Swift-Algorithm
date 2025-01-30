import Foundation

func solution(_ info:[Int], _ edges:[[Int]]) -> Int {
    var childs = Array(repeating: [Int](), count: info.count) // 자식 노드 배열
    for edge in edges {
        let (parent, child) = (edge[0], edge[1])
        childs[parent].append(child)
    }
    
    var result = 0
    func dfs(_ now: Int, _ sheep: Int, _ wolf: Int, _ nextNodes: [Int]) {
        guard sheep > wolf else { return }
        result = max(result, sheep)
        
        for next in nextNodes {
            let nextNextNodes = nextNodes.filter({ $0 != next }) + childs[next]
            if info[next] == 0 {
                dfs(next, sheep+1, wolf, nextNextNodes)
            } else {
                dfs(next, sheep, wolf+1, nextNextNodes)
            }
        }
    }
    
    dfs(0, 1, 0, childs[0])
    
    return result
}