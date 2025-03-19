var S = readLine()!.map({ String($0) })
var T = readLine()!.map({ String($0) })
var answer = 0

func dfs(_ nowT: [String]) {
    if nowT.count == S.count {
        if nowT == S {
            answer = 1
        }
        return
    }
    
    if let last = nowT.last, last == "A" {
        var removedA = nowT
        _ = removedA.popLast()
        dfs(removedA)
    }
    if let first = nowT.first, first == "B" {
        var removedB = nowT
        removedB.reverse()
        _ = removedB.popLast()
        dfs(removedB)
    }
}

dfs(T)
print(answer)