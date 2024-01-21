/*
 1번 혹은 N번 집 중 하나의 색을 고정한다. => DP 구현 상 1번 집을 고정하는 것이 편함
 1번 집 R -> N번 집 G, B 중 최소 비용
 1번 집 G -> N번 집 R, B 중 최소 비용
 1번 집 B -> N번 집 R, G 중 최소 비용
 */
import Foundation

let N = Int(readLine()!)!
var cost = [[Int]]()
for _ in 0..<N {
    cost.append(readLine()!.split(separator: " ").map { Int($0)! })
}
let max = 1000*1000+1   // 조건 상 나올 수 있는 최대값보다 큰 수

// dp[i][j]: i번째 집을 j색으로 칠했을 때의 최소 비용
var dp = [[Int]](repeating: [Int](repeating: max, count: 3), count: N)
var result = max

for j in 0..<3 {
    let nColorA = (j+1)%3
    let nColorB = (j+2)%3
    
    // 현재 확인해보는 1번 집의 색을 고르는 경우가 무조건 최소값으로 나오도록 다른 2개 색을 최대값보다 크게 넣어준다.
    dp[0][j] = cost[0][j]
    dp[0][nColorA] = max
    dp[0][nColorB] = max
    
    for i in 1..<N {
        dp[i][0] = min(dp[i-1][1], dp[i-1][2]) + cost[i][0]
        dp[i][1] = min(dp[i-1][0], dp[i-1][2]) + cost[i][1]
        dp[i][2] = min(dp[i-1][0], dp[i-1][1]) + cost[i][2]
    }
    
    result = min(result, dp[N-1][nColorA], dp[N-1][nColorB])
}

print(result)