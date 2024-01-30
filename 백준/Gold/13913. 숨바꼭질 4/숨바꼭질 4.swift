// 방문 표시를 하는 배열 visited에 이동한 위치를 넣어주고, 이를 역추적한다.
import Foundation

let NK = readLine()!.split(separator: " ").map { Int($0)! }
let N = NK[0]
let K = NK[1]

var idx = 0
var queue = [(Int, Int)]() // (현재 위치, 걸린 시간)
var visited = [Int](repeating: -1, count: 100001) // -1: 방문 안함, -2: 출발지, 나머지 숫자: 이전 위치

queue.append((N, 0))
visited[N] = -2
var result = [String]()

while idx < queue.count {
    let now = queue[idx]
    
    // 경로를 역추적해서 결과 배열에 저장해준다.
    func printResult(_ now: Int) {
        // 출발지로 돌아오면 종료
        if visited[now] == -2 {
            result.append(String(now))
            return
        }
        result.append(String(now))
        printResult(visited[now])
    }
    if now.0 == K {
        print(now.1) // 걸린 시간 출력
        printResult(now.0)
        break
    }
    
    let nextA = now.0 - 1
    let nextB = now.0 + 1
    let nextC = now.0 * 2
    
    func goBFS(_ next: Int) {
        if 0...100000 ~= next {
            if visited[next] == -1 {
                queue.append((next, now.1+1))
                visited[next] = now.0 // visited 배열에 이전 경로를 표시
            }
        }
    }
    
    goBFS(nextA)
    goBFS(nextB)
    goBFS(nextC)
    
    idx += 1
}

print(result.reversed().joined(separator: " "))