import Foundation

let NM = readLine()!.components(separatedBy: " ").map({ Int($0)! })
let (N, M) = (NM[0], NM[1])
var movePoint = [Int: Int]()

// 사다리, 뱀 정보
for _ in 0..<N+M {
    let info = readLine()!.components(separatedBy: " ").map({ Int($0)! })
    let (from, to) = (info[0], info[1])
    movePoint[from] = to
}

var answer = Int.max
var idx = 0
var queue = [(point: Int, diceCount: Int)]()
var visited = Array(repeating: false, count: 101)

queue.append((1, 0))
visited[1] = true

while idx < queue.count {
    let now = queue[idx]
    visited[now.point] = true
    
    if now.point == 100 { // 도착 시 정답 갱신
        answer = min(answer, now.diceCount)
        break
    }
    
    for dice in (1...6) {
        let next = now.point + dice
        guard next <= 100, !visited[next] else { continue }
        
        let ladderSnakePoint = movePoint[next, default: 0]
        if ladderSnakePoint != 0 {
            if !visited[ladderSnakePoint] {
                queue.append((ladderSnakePoint, now.diceCount+1)) // 주사위 이동 후 사다리나 뱀 타기
            }
        } else {
            if !visited[next] {
                queue.append((next, now.diceCount+1)) // 주사위 만큼만 이동
            }
        }
    }
    
    idx += 1
}

print(answer)