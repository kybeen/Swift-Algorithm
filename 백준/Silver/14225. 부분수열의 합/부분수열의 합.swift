import Foundation

let N = Int(readLine()!)!
let S = readLine()!.split(separator: " ").map { Int($0)! }

// 해당 인덱스의 수를 만들 수 있는지 여부 (문제 조건에 따라 나올 수 있는 최대 합은 2,000,000임)
var possibles = [Bool](repeating: false, count: 2_000_001)

func dfs(_ now: Int, _ sum: Int) {
    possibles[sum] = true
    
    for i in now+1..<N {
        dfs(i, sum+S[i])
    }
}

dfs(-1, 0)

for i in 1..<2_000_001 {
    if !possibles[i] {
        print(i)
        break
    }
}