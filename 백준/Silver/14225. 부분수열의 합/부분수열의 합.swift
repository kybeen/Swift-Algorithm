import Foundation

let N = Int(readLine()!)!
let S = readLine()!.split(separator: " ").map({ Int($0)! })
let maxNumber = S.reduce(0, +) // 가능한 가장 큰 수
var possible = Array(repeating: false, count: maxNumber+2) // 해당 숫자를 만들 수 있는지 여부 (모두 가능한 경우 대비해서 1 더 큰 수까지)
possible[0] = true

func dfs(_ now: Int, _ sum: Int) {
    possible[sum] = true
    
    for i in now+1..<N {
        dfs(i, sum + S[i])
    }
}

for i in 0..<N {
    dfs(i, S[i])
}

for (num, isPossible) in possible.enumerated() {
    if !isPossible {
        print(num)
        break
    }
}