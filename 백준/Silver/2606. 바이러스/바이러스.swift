import Foundation

let n = Int(readLine()!)!
var network = Array(repeating: [Int](), count: n+1)
for _ in 0..<Int(readLine()!)! {
    let ab = readLine()!.split(separator: " ").map { Int($0)! }
    let a = ab[0]
    let b = ab[1]
    network[a].append(b)
    network[b].append(a)
}

var idx = 0
var queue = [(computer:Int, virused:Int)]() // (현재 컴퓨터, 현재까지 감염된 컴퓨터 수)
var visited = [Bool](repeating: false, count: n+1)

queue.append((1, 0)) // 1번 컴퓨터는 카운트하지x
visited[1] = true
var result = 0

while idx < queue.count {
    let now = queue[idx]
    
    for com in network[now.computer] {
        if !visited[com] {
            visited[com] = true
            queue.append((com, now.virused + 1))
            result += 1
        }
    }
    
    idx += 1
}
print(result)