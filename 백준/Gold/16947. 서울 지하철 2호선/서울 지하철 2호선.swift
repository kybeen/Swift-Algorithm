import Foundation

let N = Int(readLine()!)!
var stations = [[Int]](repeating: [Int](), count: N+1)
for _ in 0..<N {
    let ab = readLine()!.split(separator: " ").map { Int($0)! }
    let a = ab[0]
    let b = ab[1]
    stations[a].append(b)
    stations[b].append(a)
}

var isCycle = [Bool](repeating: false, count: N+1) // 순환선인지에 대한 정보를 저장할 배열
var visited = [Bool](repeating: false, count: N+1) // 역 탐색 시 방문 횟수 체크
var line = [Int]() // 방문 역을 저장하는 스택

// 순환선 여부를 구하기 위한 DFS 함수
func dfs(_ depth: Int, _ start: Int, _ now: Int) {
    // 한 바퀴 돌았다면 순환선임 (depth가 3 이상이어야 순환선이 될 수 있다.)
    if depth >= 3 && start == now {
        for l in line {
            isCycle[l] = true
        }
        return
    }
    
    for station in stations[now] {
        // 이미 순환선이 확인된 역이면 탐색하지 않는다.
        guard !isCycle[station] else { continue }
        
        if !visited[station] {
            visited[station] = true
            line.append(station)
            dfs(depth+1, start, station)
            _ = line.popLast()
            visited[station] = false
        } else {
            if depth >= 3 && station == start {
                dfs(depth, start, station)
            }
        }
    }
}

for i in 1...N {
    guard !isCycle[i] else { continue }
    
    visited[i] = true
    line.append(i)
    dfs(1, i, i)
    _ = line.popLast()
    visited[i] = false
}

var result = [Int](repeating: 0, count: N+1) // 각 역과 순환선 사이의 거리

// 각 역과 순환선 사이의 거리를 구하기 위한 BFS 함수
func bfs(_ start: Int) {
    var idx = 0
    var queue = [(Int, Int)]() // (역 번호, 이동 거리)
    var visited = [Bool](repeating: false, count: N+1)
    queue.append((start, 0))
    visited[start] = true
    
    while idx < queue.count {
        let now = queue[idx]
        if isCycle[now.0] {
            result[start] = now.1
            return
        }
        
        for station in stations[now.0] {
            if !visited[station] {
                queue.append((station, now.1+1))
                visited[station] = true
            }
        }
        idx += 1
    }
}

for i in 1...N {
    // 순환선이 아닐 경우에 대해서만 구해준다.
    if !isCycle[i] {
        bfs(i)
    }
}
print(result[1...N].map { String($0) }.joined(separator: " "))