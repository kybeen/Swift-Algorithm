// 1을 포함하면서 N/2명을 만드는 경우의 수를 구해본다. (이렇게 하면 만들 수 있는 한쪽 팀의 모든 경우가 나옴)
import Foundation

let N = Int(readLine()!)!
var S = [[Int]]()
for _ in 0..<N {
    S.append(readLine()!.split(separator: " ").map{ Int($0)! })
}

var totalTeam = [Int](0..<N) // 전체 인원의 인덱스
var startTeam = [Int]()
var linkTeam = [Int]()
var result = Int.max

// 팀의 합을 구하는 메서드
func makeSum(_ team: [Int]) -> Int {
    var sum = 0
    
    for i in team {
        for j in team {
            sum += S[i][j]
        }
    }
    
    return sum
}

func dfs(_ depth: Int, _ now: Int) {
    if depth == N/2 {
        //능력치 합 비교 후 최소값 갱신
        linkTeam = totalTeam.filter { !startTeam.contains($0) }
        
        let startSum = makeSum(startTeam)
        let linkSum = makeSum(linkTeam)
        result = min(result, abs(startSum - linkSum))
        return
    }
    
    for i in now+1..<N {
        if !startTeam.contains(i) {
            startTeam.append(i)
            dfs(depth+1, i)
            _ = startTeam.popLast()
        }
    }
}

startTeam.append(0)
dfs(1, 0)

print(result)