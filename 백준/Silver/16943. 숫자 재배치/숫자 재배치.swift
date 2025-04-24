import Foundation

let AB = readLine()!.components(separatedBy: " ")
let (A, B) = (Int(AB[0])!, Int(AB[1])!)
let numsOfA = AB[0].map({ Int(String($0))! })
var answer = -1

var visited = Array(repeating: false, count: numsOfA.count)
var C: String = ""

func dfs() {
    if C.count == numsOfA.count {
        let cNum = Int(C)!
        if cNum < B {
            answer = max(answer, cNum)
        }
        return
    }
    
    for i in 0..<numsOfA.count {
        if C.isEmpty && numsOfA[i] == 0 { continue } // C는 0으로 시작하면 안됨
        if !visited[i] {
            visited[i] = true
            C += "\(numsOfA[i])"
            dfs()
            _ = C.popLast()
            visited[i] = false
        }
    }
}
dfs()
print(answer)