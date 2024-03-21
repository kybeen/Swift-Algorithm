import Foundation

func solution(_ edges:[[Int]]) -> [Int] {
    var n = 0 // 노드 개수
    var nodes: [Int:[Int]] = [:] // 노드번호 : [나가는 간선 개수, 들어오는 간선 개수]
    for edge in edges {
        let a = edge[0]
        let b = edge[1]
        // 나가는 간선 체크
        if nodes[a] == nil {
            nodes[a] = [1, 0]
        } else {
            nodes[a]![0] += 1
        }
        // 들어오는 간선 체크
        if nodes[b] == nil {
            nodes[b] = [0, 1]
        } else {
            nodes[b]![1] += 1
        }
        n = max(n, a, b)
    }
    
    var result = [0, 0, 0, 0] // [정점, 도넛, 막대, 8자]
    for i in 1...n {
        if let node = nodes[i] {
            // 나가는 간선 0개 => 막대그래프 끝점
            if node[0] == 0 {
                result[2] += 1
            } else if node[0] >= 2 { // 나가는 간선 2개 이상
                if node[1] == 0 { // + 들어오는 간선 0개 => 정점
                    result[0] = i
                } else if node[1] >= 2 { // + 들어오는 간선 2개 이상 => 8자 그래프 중앙
                    result[3] += 1
                }
            }
        }
        // // 나가는 간선 0개 => 막대그래프 끝점
        // if nodes[i]![0] == 0 {
        //     result[2] += 1
        // } else if nodes[i]![0] >= 2 { // 나가는 간선 2개 이상
        //     if nodes[i]![1] == 0 { // + 들어오는 간선 0개 => 정점
        //         result[0] = i
        //     } else if nodes[i]![1] >= 2 { // + 들어오는 간선 2개 이상 => 8자 그래프 중앙
        //         result[3] += 1
        //     }
        // }
    }
    // 총 그래프 개수(정점에서 나가는 간선) - 막대 - 8자 => 도넛
    result[1] = nodes[result[0]]![0] - result[2] - result[3]
    
    return result
}