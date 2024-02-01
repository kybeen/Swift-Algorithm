import Foundation

func solution(_ tickets:[[String]]) -> [String] {
    let n = tickets.count
    
    var result = [String]()
    var resultPath = String(repeating: "ZZZ", count: n+1) // 경로를 모두 이어 붙인 하나의 String (알파벳 순서 확인용)
    var stack = [String]()
    var visited = [Bool](repeating: false, count: n)
    func dfs(_ now: [String], _ depth: Int) {
        // 티켓을 모두 사용했을 때
        if depth == n {
            stack.append(now[1]) // 마지막 도착지는 따로 추가해줘야함
            let nowPath = stack.joined(separator: "")
            // 알파벳 순으로 앞서는 경로 갱신
            if nowPath < resultPath {
                resultPath = nowPath
                result = stack
            }
            stack.popLast()
            return
        }
        
        for i in 0..<n {
            if !visited[i] {
                // 현재 티켓과 이어서 쓸 수 있는 경로라면 진행
                if tickets[i][0] == now[1] {
                    stack.append(tickets[i][0])
                    visited[i] = true
                    dfs(tickets[i], depth+1)
                    visited[i] = false
                    stack.popLast()
                }
            }
        }
    }
    
    // "ICN"에서 출발하는 티켓을 기준으로 DFS 시작
    for i in 0..<n {
        if tickets[i][0] == "ICN" {
            stack.append(tickets[i][0])
            visited[i] = true
            dfs(tickets[i], 1)
            visited[i] = false
            stack.popLast()
        }
    }
    
    return result
}