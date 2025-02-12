import Foundation

func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    var sortedEdges = costs.sorted { $0[2] < $1[2] }
    var root = Array(0..<n)
    var result = 0
    
    // of 그룹의 루트를 모두 to 그룹의 루트로 업데이트
    func updateRoot(of: Int, to: Int) {
        let rootToUpdate = root[of]
        let target = root[to]
        
        for i in 0..<n {
            if root[i] == rootToUpdate {
                root[i] = target
            }
        }
    }
    
    for edge in sortedEdges {
        let a = edge[0]
        let b = edge[1]
        let cost = edge[2]
        
        // 사이클이 아니라면 다리를 건설 + 두 노드의 루트를 하나로 통일
        if root[a] != root[b] {
            updateRoot(of: a, to: b)
            result += cost
        }
    }
    
    return result
}