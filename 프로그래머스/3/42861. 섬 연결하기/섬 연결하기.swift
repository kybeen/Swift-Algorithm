import Foundation

func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    var roots = Array(0..<n)
    var result = 0
    
    let sortedEdges = costs.sorted { $0[2] < $1[2] }
    
    func updateRoot(from: Int, to: Int) {
        let target = roots[from]
        let updatedRoot = roots[to]
        for i in 0..<n {
            if roots[i] == target {
                roots[i] = updatedRoot
            }
        }
    }
    
    for edge in sortedEdges {
        let a = edge[0]
        let b = edge[1]
        let cost = edge[2]
        
        if roots[a] != roots[b] {
            result += cost
            // roots[b] = roots[a]
            updateRoot(from: a, to: b)
        }
    }
    
    return result
}