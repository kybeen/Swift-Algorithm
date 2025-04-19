import Foundation

let FSGUD = readLine()!.split(separator: " ").map({ Int($0)! })
let (F, S, G, U, D) = (FSGUD[0], FSGUD[1], FSGUD[2], FSGUD[3], FSGUD[4])

var visited = Array(repeating: false, count: F+1)
var idx = 0
var queue = [(now: Int, count: Int)]()
queue.append((S, 0))
visited[S] = true

var answer = "use the stairs"
while idx < queue.count {
    let (now, count) = queue[idx]
    if now == G {
        answer = String(count)
        break
    }
    
    let moveUp = now + U
    if moveUp != now && (1...F) ~= moveUp {
        if !visited[moveUp] {
            visited[moveUp] = true
            queue.append((moveUp, count+1))
        }
    }
    
    let moveDown = now - D
    if moveDown !=  now && (1...F) ~= moveDown {
        if !visited[moveDown] {
            visited[moveDown] = true
            queue.append((moveDown, count+1))
        }
    }
    
    idx += 1
}
print(answer)