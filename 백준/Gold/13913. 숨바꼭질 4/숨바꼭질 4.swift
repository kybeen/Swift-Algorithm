// 방문 표시를 하는 배열 visited에 이동한 위치를 넣어주고, 이를 역추적한다.
import Foundation

let NK = readLine()!.split(separator: " ").map { Int($0)! }
let N = NK[0]
let K = NK[1]

var idx = 0
var queue = [Int]()
var visited = [Int](repeating: -1, count: 100001) // -1: 방문 안함, -2: 출발지, 나머지 숫자: 이전 위치

queue.append(N)
visited[N] = -2
var result = [String]()

while idx < queue.count {
    let now = queue[idx]
    
    // K에 도착하면 경로를 역추적해서 결과 배열에 저장해준다.
    if now == K {
        var i = now
        while i != -2 {
            result.append(String(i))
            i = visited[i]
        }
        break
    }
    
    var nextCase = [-1, 1, now]
    for d in nextCase {
        if 0...100000 ~= now+d && visited[now+d] == -1 {
            queue.append(now+d)
            visited[now+d] = now // visited 배열에 이전 경로를 표시
        }
    }
    
    idx += 1
}

print(result.count - 1)
print(result.reversed().joined(separator: " "))