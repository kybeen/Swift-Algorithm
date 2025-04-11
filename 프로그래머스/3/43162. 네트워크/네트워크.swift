import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var visited = Array(repeating: false, count: n)
    var answer = 0
    
    for i in 0..<n {
        if !visited[i] {
            answer += 1
            var idx = 0
            var queue = [Int]()
            visited[i] = true
            queue.append(i)
            
            while idx < queue.count {
                let now = queue[idx]
                for (next, isConnected) in computers[now].enumerated() {
                    if isConnected == 1 && !visited[next] {
                        visited[next] = true
                        queue.append(next)
                    }
                }
                
                idx += 1
            }
        }
    }
    
    return answer
}