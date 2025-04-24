import Foundation

let NLRX = readLine()!.split(separator: " ").map({ Int($0)! })
let (N, L, R, X) = (NLRX[0], NLRX[1], NLRX[2], NLRX[3])
let A = readLine()!.split(separator: " ").map({ Int($0)! }).sorted(by: <)

var answer = 0
var stk = [Int]()

func dfs(_ start: Int) {
    if stk.count >= 2 {
        let sum = stk.reduce(0, +)
        let diff = stk.last! - stk.first!
        if L...R ~= sum && diff >= X {
            answer += 1
        }
    }
    
    for i in start..<A.count {
        stk.append(A[i])
        dfs(i+1)
        _ = stk.popLast()
    }
}
dfs(0)
print(answer)