let NM = readLine()!.split(separator: " ").map({ Int($0)! })
let (N, M) = (NM[0], NM[1])

// 이야기의 진실을 아는 사람들
var truthInput = readLine()!.split(separator: " ").map({ Int($0)! })
let truthCount = truthInput.removeFirst()
var truth = Set<Int>(truthInput) // 진실을 아는 사람들

var parents = Array(0...N)
func find(_ node: Int) -> Int {
    if parents[node] == node {
        return parents[node]
    } else {
        parents[node] = find(parents[node])
        return parents[node]
    }
}

func union(_ a: Int, _ b: Int) {
    let rootA = find(a)
    let rootB = find(b)
    
    if truth.contains(rootA) {
        parents[rootB] = rootA
    } else if truth.contains(rootB) {
        parents[rootA] = rootB
    } else {
        parents[rootB] = rootA
    }
}

// 각 파티
var parties = [[Int]]()
for _ in 0..<M {
    var partyInfo = readLine()!.split(separator: " ").map({ Int($0)! })
    _ = partyInfo.removeFirst()
    parties.append(partyInfo)
    
    for i in 1..<partyInfo.count {
        union(partyInfo[0], partyInfo[i])
    }
}

var answer = 0
for party in parties {
    let root = find(party[0])
    if !truth.contains(root) {
        answer += 1
    }
}
print(answer)