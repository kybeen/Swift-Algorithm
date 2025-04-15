import Foundation

let N = Int(readLine()!)!
let W = readLine()!.split(separator: " ").map({ Int($0)! })

var answer = 0

func dfs(_ nowW: [Int], _ energy: Int) {
    if nowW.count == 2 {
        answer = max(answer, energy)
        return
    }
    
    for i in 1..<nowW.count-1 {
        let combine = nowW[i-1] * nowW[i+1]
        var nextW = nowW
        nextW.remove(at: i)
        dfs(nextW, energy+combine)
    }
}

dfs(W, 0)
print(answer)