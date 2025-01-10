import Foundation

struct Point {
    let i: Int
    let j: Int
    
    init(_ i: Int, _ j: Int) {
        self.i = i
        self.j = j
    }
    
    func isValid(in length: Int) -> Bool {
        guard i >= 0 && j >= 0 && i < length && j < length else {
            return false
        }
        return true
    }
}

func solution(_ land:[[Int]], _ height:Int) -> Int {
    let N = land.count
    let di = [-1, 1, 0, 0]
    let dj = [0, 0, -1, 1]
    
    var group = Array(repeating: Array(repeating: -1, count: N), count: N)
    var groupNum = 0
    
    /// 그룹을 만들기 위한 BFS 함수
    func bfs(_ start: Point) {
        var idx = 0
        var queue: [Point] = [start]
        
        while idx < queue.count {
            let now = queue[idx]
            group[now.i][now.j] = groupNum
            
            for k in 0..<4 {
                let next = Point(now.i+di[k], now.j+dj[k])
                guard next.isValid(in: N) else { continue }
                let nowHeight = land[now.i][now.j]
                let nextHeight = land[next.i][next.j]
                let cost = abs(nowHeight - nextHeight)
                if (cost <= height) && (group[next.i][next.j] != groupNum) {
                    group[next.i][next.j] = groupNum
                    queue.append(next)
                }
            }
            
            idx += 1
        }
    }
    
    /// 사다리 설치 없이 이동 가능한 그룹 나누기
    for i in 0..<N {
        for j in 0..<N {
            if group[i][j] == -1 {
                groupNum += 1
                let startPoint = Point(i,j)
                bfs(startPoint)
            }
        }
    }
    
    // for g in group {
    //     print(g)
    // }
    
    /// 그룹 간 간선(사다리) 비용 구하기
    var edges = [(a: Int, b: Int, cost: Int)]() // (그룹A, 그룹B, 사다리비용)
    for i in 0..<N {
        for j in 0..<N {
            let now = Point(i,j)
            for k in 0..<4 {
                let next = Point(now.i+di[k], now.j+dj[k])
                guard next.isValid(in: N) else { continue }
                // 다른 그룹인 경우의 사다리 간선 추가
                let nowGroup = group[now.i][now.j]
                let nextGroup = group[next.i][next.j]
                if nowGroup != nextGroup {
                    let cost = abs(land[now.i][now.j] - land[next.i][next.j])
                    let a = min(nowGroup, nextGroup)
                    let b = max(nowGroup, nextGroup)
                    edges.append((a, b, cost))
                }
            }
        }
    }
    
    // for edge in edges {
    //     print(edge)
    // }
    
    /// 그룹 노드들의 최소 신장 트리 구하기
    var result: Int = 0
    var parents: [Int] = Array(0...groupNum)
    var rank = Array(repeating: 0, count: groupNum+1)
    edges.sort { $0.cost < $1.cost }
    
    /// Union-Find의 루트 합치기
    func union(_ a: Int, _ b: Int) {
        let rootA = find(a)
        let rootB = find(b)
        
        if rank[rootA] > rank[rootB] {
            parents[rootB] = rootA
        } else if rank[rootA] < rank[rootB] {
            parents[rootA] = rootB
        } else {
            parents[rootB] = rootA
            rank[rootA] += 1
        }
    }
    
    /// Union-Find의 루트 노드 찾기
    func find(_ node: Int) -> Int {
        if parents[node] == node {
            return node
        } else {
            parents[node] = find(parents[node]) // 경로 압축
            return parents[node]
        }
    }
    
    for edge in edges {
        // 서로 다른 집합이면 합치기
        let rootA = find(edge.a)
        let rootB = find(edge.b)
        if rootA != rootB {
            union(edge.a, edge.b)
            // 최소 신장 트리 간선의 비용들을 더해준다.
            result += edge.cost
        }
    }
    
    return result
}