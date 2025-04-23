import Foundation

let st = readLine()!.split(separator: " ").map({ Int($0)! })
let (s, t) = (st[0], st[1])
var visited = Set<Int>()

var answer = ""
if s == t {
    answer = "0"
} else {
    var idx = 0
    var queue = [(s: Int, operators: String)]()
    queue.append((s, ""))

    while idx < queue.count {
        let (s, operators) = queue[idx]
        if s == t {
            answer = operators
            break
        }
        
        // *
        if s <= Int(sqrt(Double(Int.max))) {
            let nextS = s * s
            if !visited.contains(nextS) {
                visited.insert(nextS)
                queue.append((nextS, operators+"*"))
            }
        }
        // +
        if s <= Int.max / 2 {
            let nextS = s + s
            if !visited.contains(nextS) {
                visited.insert(nextS)
                queue.append((nextS, operators+"+"))
            }
        }
        // -
        let nextS = s - s
        if !visited.contains(nextS) {
            visited.insert(nextS)
            queue.append((nextS, operators+"-"))
        }
        // /
        if s != 0 {
            let nextS = s / s
            if !visited.contains(nextS) {
                visited.insert(nextS)
                queue.append((nextS, operators+"/"))
            }
        }
        
        idx += 1
    }
    
    if answer.isEmpty {
        answer = "-1"
    }
}

print(answer)