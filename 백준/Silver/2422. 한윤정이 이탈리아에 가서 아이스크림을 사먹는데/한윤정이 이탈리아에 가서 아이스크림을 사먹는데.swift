import Foundation

let NM = readLine()!.split(separator: " ").map({ Int($0)! })
let (N, M) = (NM[0], NM[1])
var dont = Array(repeating: Array(repeating: false, count: N+1), count: N+1) // dont[i][j]가 true면 그 아이스크림은 같이 먹으면 x
for _ in 0..<M {
    let ab = readLine()!.split(separator: " ").map({ Int($0)! })
    let (a, b) = (ab[0], ab[1])
    dont[a][b] = true
    dont[b][a] = true
}
//dont.forEach { print($0) }

var answer = 0
var stk = [Int]()

/// b 아이스크림이 iceCreams와 가능한 조합인지 확인
func isPossible(_ iceCreams: [Int], _ b: Int) -> Bool {
    for a in iceCreams {
        if dont[a][b] {
            return false
        }
    }
    return true
}

func dfs(_ now: Int) {
    if stk.count == 3 {
        answer += 1
        return
    }
    
    for i in now..<N+1 {
        if isPossible(stk, i) {
            stk.append(i)
            dfs(i+1)
            _ = stk.popLast()
        }
    }
}

dfs(1)
print(answer)