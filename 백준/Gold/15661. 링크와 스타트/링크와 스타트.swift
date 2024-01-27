/*
 1번 사람을 start 팀에 고정시켜놨을 때 start 팀을 꾸릴 수 있는 경우의 수를 모두 구하면 2 팀으로 나뉘는 모든 경우가 나온다.
 - start -> 1, 12, 13, 14, 123, 124, 134
 - link -> 234, 34, 24, 23, 4, 3, 2
 */
import Foundation

let N = Int(readLine()!)!
var status = [[Int]]()
for _ in 0..<N {
    status.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var result = Int.max
var totalMember = [Int](0..<N)
var start = [Int]()

// 스타트 팀과 링크 팀의 능력치 차이를 구하는 함수
func calcSum(_ start: [Int], _ link: [Int]) -> Int {
    var startSum = 0
    var linkSum = 0
    for startA in start {
        for startB in start {
            startSum += status[startA][startB]
        }
    }
    for linkA in link {
        for linkB in link {
            linkSum += status[linkA][linkB]
        }
    }
    
    return abs(startSum - linkSum)
}

func dfs(_ now: Int) {
    let link = totalMember.filter{ !start.contains($0) }
    result = min(result, calcSum(start, link))
    
    for i in now+1..<N {
        if !start.contains(i) {
            if start.count < N { // start팀원 수가 N보다 작아야 link팀에 최소 1명이라도 있음
                start.append(i)
                dfs(i)
                _ = start.popLast()
            }
        }
    }
}

start.append(0)
dfs(0)
print(result)