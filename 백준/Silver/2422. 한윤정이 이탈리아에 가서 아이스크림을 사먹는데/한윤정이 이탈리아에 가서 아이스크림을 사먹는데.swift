import Foundation

let NM = readLine()!.split(separator: " ").map({ Int($0)! })
let (N, M) = (NM[0], NM[1])
var dont = [Int: Set<Int>]() // key-아이스크림 : value-같이먹으면안되는아이스크림
for _ in 0..<M {
    let ab = readLine()!.split(separator: " ").map({ Int($0)! })
    let (a, b) = (ab[0], ab[1])
    dont[a, default: []].insert(b)
    dont[b, default: []].insert(a)
}
//dont.forEach { print($0) }

var combinations = [[Int]]()
var stk = [Int]()

/// b 아이스크림이 iceCreams와 가능한 조합인지 확인
func isPossible(_ iceCreams: [Int], _ b: Int) -> Bool {
    for a in iceCreams {
        if let dontSet = dont[a], dontSet.contains(b) {
            return false
        }
    }
    return true
}

func dfs(_ now: Int) {
    if stk.count == 3 {
        combinations.append(stk)
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
print(combinations.count)