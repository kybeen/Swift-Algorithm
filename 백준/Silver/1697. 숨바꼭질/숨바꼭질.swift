import Foundation

let NK = readLine()!.split(separator: " ").map { Int($0)! }
let N = NK[0]
let K = NK[1]

var visited = [Bool](repeating: false, count: 100001)
var queue = [(loc:Int, sec:Int)]()
visited[N] = true
queue.append((N, 0))

var idx = 0
while idx < queue.count {
    let now = queue[idx]
    if now.loc == K {
        print(now.sec)
        break
    }
    
    let a = now.loc-1
    let b = now.loc+1
    let c = now.loc*2
    
    if 0...100000 ~= a && !visited[a] {
        visited[a] = true
        queue.append((a, now.sec+1))
    }
    if 0...100000 ~= b && !visited[b] {
        visited[b] = true
        queue.append((b, now.sec+1))
    }
    if 0...100000 ~= c && !visited[c] {
        visited[c] = true
        queue.append((c, now.sec+1))
    }
    
    idx += 1
}