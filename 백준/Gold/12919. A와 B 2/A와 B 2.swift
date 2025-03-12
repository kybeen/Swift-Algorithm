let S = readLine()!.map({ String($0) })
let T = readLine()!.map({ String($0) })

var isTransformable: Bool = false
func dfs(_ nowT: [String]) {
    if isTransformable { return }
    if nowT.count < S.count { return }
    
    if (nowT.count == S.count) && (nowT == S) {
        isTransformable = true
        return
    }
    
    // 뒤에 A를 추가한 경우
    if let last = nowT.last, last == "A" {
        var caseA = nowT
        _ = caseA.popLast()
        dfs(caseA)
    }
    
    // 뒤에 B를 추가하고 뒤집은 경우
    if let first = nowT.first, first == "B" {
        var caseB = nowT
        caseB.reverse()
        _ = caseB.popLast()
        dfs(caseB)
    }
}

dfs(T)
print(isTransformable ? 1 : 0)