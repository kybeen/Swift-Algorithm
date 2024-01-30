import Foundation

let S = Int(readLine()!)!

var idx = 0
var queue = [(Int, Int, Int)]() // (현재 이코티콘 개수, 클립보드의 이모티콘 수, 걸린 시간)
var visited = [[Bool]](repeating: [Bool](repeating: false, count: 2001), count: 2001)

queue.append((1, 0, 0))
visited[1][0] = true

while idx < queue.count {
    let now = queue[idx]
    
    if now.0 == S {
        print(now.2)
        exit(0)
    }
    
    // 1. 화면에 있는 이모티콘을 모두 복사해서 클립보드에 저장한다.
    if (now.0 != now.1) && (0...2000 ~= now.0) && !visited[now.0][now.0] {
        queue.append((now.0, now.0, now.2+1))
        visited[now.0][now.0] = true
    }
    // 2. 클립보드에 있는 모든 이모티콘을 화면에 붙여넣기 한다.
    if (now.1 > 0) && (0...2000 ~= now.0+now.1) && !visited[now.0+now.1][now.1] {
        queue.append((now.0+now.1, now.1, now.2+1))
        visited[now.0+now.1][now.1] = true
    }
    // 3. 화면에 있는 이모티콘 중 하나를 삭제한다.
    if (now.0 > 0) && !visited[now.0-1][now.1] {
        queue.append((now.0-1, now.1, now.2+1))
        visited[now.0-1][now.1] = true
    }
    
    idx += 1
}