import Foundation

let ABC = readLine()!.split(separator: " ").map({ Int($0)! })
var checked = Set<[Int]>()

var idx = 0
var queue = [[Int]]()
queue.append(ABC)
checked.insert(ABC)

func nextPossibleABCs(of abc: [Int]) -> [[Int]] {
    var possibles = [[Int]]()
    
    if abc[0] != abc[1] {
        if abc[0] < abc[1] {
            let X = abc[0]
            let Y = abc[1]
            possibles.append([X+X, Y-X, abc[2]])
        } else {
            let X = abc[1]
            let Y = abc[0]
            possibles.append([Y-X, X+X, abc[2]])
        }
    }
    if abc[0] != abc[2] {
        if abc[0] < abc[2] {
            let X = abc[0]
            let Y = abc[2]
            possibles.append([X+X, abc[1], Y-X])
        } else {
            let X = abc[2]
            let Y = abc[0]
            possibles.append([Y-X, abc[1], X+X])
        }
    }
    if abc[1] != abc[2] {
        if abc[1] < abc[2] {
            let X = abc[1]
            let Y = abc[2]
            possibles.append([abc[0], X+X, Y-X])
        } else {
            let X = abc[2]
            let Y = abc[1]
            possibles.append([abc[0], Y-X, X+X])
        }
    }
    
    return possibles
}

var answer = 0
while idx < queue.count {
    let now = queue[idx]
    
    if now[0] == now[1] && now[0] == now[2] && now[1] == now[2] {
        answer = 1
        break
    }
    
    for next in nextPossibleABCs(of: now) {
        if !checked.contains(next) {
            checked.insert(next)
            queue.append(next)
        }
    }
    
    idx += 1
}
print(answer)