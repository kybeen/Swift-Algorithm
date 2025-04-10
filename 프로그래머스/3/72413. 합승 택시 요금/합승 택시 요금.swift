import Foundation

func solution(_ n:Int, _ s:Int, _ a:Int, _ b:Int, _ fares:[[Int]]) -> Int {
    // edges[i]: i번 지점에 연결된 간선들
    var costs: [[Int]] = Array(repeating: Array(repeating: Int.max, count: n+1), count: n+1) 
    for fare in fares {
        let (a, b, cost) = (fare[0], fare[1], fare[2])
        costs[a][b] = cost
        costs[b][a] = cost
    }
    for i in 1...n {
        costs[i][i] = 0
    }
    // costs.forEach { print($0) }
    
    // 플로이드워셜 -> 각 정점 간 최소 거리 구하기
    // best[i][j]: i번 지점에서 j번 지점으로 가는 최소 비용
    var best = costs
    for stopover in 1...n {
        for a in 1...n {
            for b in 1...n {
                guard best[a][stopover] != Int.max && best[stopover][b] != Int.max else { continue }
                let stopoverCost = best[a][stopover] + best[stopover][b]
                if best[a][b] > stopoverCost {
                    best[a][b] = stopoverCost
                }
            }
        }
    }
    // best.forEach { print($0) }
    
    // s에서 경유지를 거쳐 a와 b로 가는 최소 비용 구하기 (경유지가 s인 경우는 바로 이동하는 경우)
    var answer = Int.max
    for stopover in 1...n {
        guard best[s][stopover] != Int.max && best[stopover][a] != Int.max && best[stopover][b] != Int.max else { continue }
        answer = min(answer, best[s][stopover] + best[stopover][a] + best[stopover][b])
    }
    
    return answer
}