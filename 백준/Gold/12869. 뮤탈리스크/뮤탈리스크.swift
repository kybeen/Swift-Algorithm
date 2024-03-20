import Foundation

let N = Int(readLine()!)!
var SCV = readLine()!.split(separator: " ").map { Int($0)! }

let da = [-9, -9, -3, -3, -1, -1]
let db = [-3, -1, -1, -9, -3, -9]
let dc = [-1, -3, -9, -1, -9, -3]

if N == 1 { // SCV가 1개일 때
    SCV.append(0)
    SCV.append(0)
} else if N == 2 { // SCV가 2개일 때
    SCV.append(0)
}

// SCV들의 체력이 [a][b][c] 일 때의 방문 여부
var visited = Array(repeating: Array(repeating: Array(repeating: false, count: SCV[2]+1), count: SCV[1]+1), count: SCV[0]+1)
var queue = [(scv: (Int, Int, Int), attack: Int)]() // ((scv1, scv2, scv3), 공격 횟수)

visited[SCV[0]][SCV[1]][SCV[2]] = true
queue.append(((SCV[0], SCV[1], SCV[2]), 0))

while !queue.isEmpty {
    let now = queue.removeFirst()
    
    if now.scv.0 <= 0 && now.scv.1 <= 0 && now.scv.2 <= 0 {
        print(now.attack)
        break
    }
    
    for i in 0..<6 {
        // 공격한 뒤의 체력
        let new_a = now.scv.0 + da[i]
        let new_b = now.scv.1 + db[i]
        let new_c = now.scv.2 + dc[i]
        
        if !visited[new_a.visitedIdx][new_b.visitedIdx][new_c.visitedIdx] {
            visited[new_a.visitedIdx][new_b.visitedIdx][new_c.visitedIdx] = true
            queue.append(((new_a, new_b, new_c), now.attack+1))
        }
    }
}

extension Int {
    // Int 값이 음수면 0을 반환하는 프로퍼티
    var visitedIdx: Self {
        self < 0 ? 0 : self
    }
}