import Foundation

func solution(_ land:[[Int]], _ height:Int) -> Int {
    typealias Point = (i: Int, j: Int)
    let N = land.count
    
    // MARK: - 그룹 나누기
    
    var group = Array(repeating: Array(repeating: -1, count: N), count: N) // group[i][j]: i,j좌표의 그룹 번호
    /// start 좌표부터 시작해서 groupNum 번호 그룹을 구하는 함수
    func makeGroup(_ start: Point, _ groupNum: Int) {
        var idx = 0
        var queue = [Point]()
        queue.append(start)
        group[start.i][start.j] = groupNum
        
        let di = [-1, 1, 0, 0]
        let dj = [0, 0, -1, 1]
        
        while idx < queue.count {
            let now = queue[idx]
            let nowHeight = land[now.i][now.j]
            
            for k in 0..<4 {
                let nextI = now.i + di[k]
                let nextJ = now.j + dj[k]
                guard nextI >= 0 && nextJ >= 0 && nextI < N && nextJ < N else { continue }
                let possibleToMove = abs(land[nextI][nextJ] - nowHeight) <= height
                // 아직 그룹이 안정해져있고, 이동 가능한 높이차라면 그룹에 등록
                if group[nextI][nextJ] == -1 && possibleToMove {
                    queue.append((nextI, nextJ))
                    group[nextI][nextJ] = groupNum
                }
            }
            
            idx += 1
        }
    }
    
    var groupNum = 0
    for i in 0..<N {
        for j in 0..<N {
            if group[i][j] == -1 {
                groupNum += 1
                makeGroup((i, j), groupNum)
            }
        }
    }
    
    // MARK: - 그룹 간 사다리 간선 구하기
    
    struct Ladder: Hashable {
        let a: Int // 그룹A
        let b: Int // 그룹B
        let cost: Int // 그룹A~그룹B에 설치 가능한 사다리 비용
        
        init(_ a: Int, _ b: Int, _ cost: Int) {
            self.a = a
            self.b = b
            self.cost = cost
        }
    }
    var edges = Set<Ladder>()
    
    /// 그룹 간에 가능한 모든 사다리 설치 비용을 구하는 함수
    func getAllPossibleLadders() {
        for i in 0..<N {
            for j in 0..<N {
                // 탐색 방향이 있기 때문에 아래/오른쪽만 확인하면 됨
                let di = [1, 0]
                let dj = [0, 1]
                for k in 0..<2 {
                    let nextI = i + di[k]
                    let nextJ = j + dj[k]
                    guard nextI >= 0 && nextJ >= 0 && nextI < N && nextJ < N else { continue }
                    let groupA = group[i][j]
                    let groupB = group[nextI][nextJ]
                    if groupA != groupB {
                        let ladderCost = abs(land[i][j] - land[nextI][nextJ])
                        // a,b그룹만 바꾼 동일한 간선이 이미 있는지 확인 후 추가
                        if !edges.contains(Ladder(groupB, groupA, ladderCost)) {
                            edges.insert(Ladder(groupA, groupB, ladderCost))
                        }
                    }
                }
            }
        }
    }
    
    getAllPossibleLadders()
    
    // MARK: - 최소 신장 트리 구하기
    
    var parent = Array(0...groupNum)
    var rank = Array(repeating: 0, count: groupNum+1)
    
    /// Union-Find 함수
    func union(_ a: Int, _ b: Int) {
        let rootA = find(a)
        let rootB = find(b)
        if rank[rootA] > rank[rootB] {
            parent[rootB] = rootA
        } else if rank[rootA] < rank[rootB] {
            parent[rootA] = rootB
        } else {
            parent[rootB] = rootA
            rank[rootA] += 1
        }
    }
    
    func find(_ node: Int) -> Int {
        if parent[node] == node {
            return node
        } else {
            parent[node] = find(parent[node])
            return parent[node]
        }
    }
    
    let sortedEdges = edges.sorted { $0.cost < $1.cost }
    var result = 0
    
    for edge in sortedEdges {
        let rootA = find(edge.a)
        let rootB = find(edge.b)
        // 사이클이 아니라면 사다리 연결
        if rootA != rootB {
            result += edge.cost
            union(edge.a, edge.b)
        }
    }
    
    return result
}