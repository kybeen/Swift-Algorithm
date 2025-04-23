import Foundation

let NM = readLine()!.split(separator: " ").map({ Int($0)! })
let (N, M) = (NM[0], NM[1])
var isFriend = Array(repeating: Array(repeating: false, count: N+1), count: N+1)
var friendCount = Array(repeating: 0, count: N+1)
for _ in 0..<M {
    let ab = readLine()!.split(separator: " ").map({ Int($0)! })
    let (a, b) = (ab[0], ab[1])
    isFriend[a][b] = true
    isFriend[b][a] = true
    friendCount[a] += 1
    friendCount[b] += 1
}

var answer = Int.max
var stk = [Int]()

func dfs(_ start: Int) {
    if stk.count == 3 {
        let sum = stk.reduce(0) { $0 + friendCount[$1] } - 6
        answer = min(answer, sum)
        return
    }
    
    for b in start..<N+1 {
        var isPossible = true // 현재 stk의 사람들이랑 친구인지
        for a in stk {
            if !isFriend[a][b] {
                isPossible = false
                break
            }
        }
        if isPossible {
            stk.append(b)
            dfs(b+1)
            _ = stk.popLast()
        }
    }
}

dfs(1)
print(answer == Int.max ? -1 : answer)