import Foundation

let N = Int(readLine()!)!
var S = [[Int]]()
for _ in 0..<N {
    S.append(readLine()!.split(separator: " ").map { Int($0)! })
}

let total = [Int](0..<N)
var start = [Int]()
var result = Int.max

func getSum(_ team: [Int]) -> Int {
    var sum = 0
    for i in 0..<team.count {
        for j in 0..<team.count {
            sum += S[team[i]][team[j]]
        }
    }
    return sum
}

func dfs(_ nowIdx: Int, _ depth: Int) {
    if depth == N/2 {
        let link = total.filter { !start.contains($0) }
        let startSum = getSum(start)
        let linkSum = getSum(link)
        
        result = min(result, abs(startSum - linkSum))
    }
    
    for i in nowIdx+1..<N {
        start.append(i)
        dfs(i, depth+1)
        _ = start.popLast()
    }
}

// 0번 사람은 start 팀 고정
start.append(0)
dfs(0, 1)
print(result)