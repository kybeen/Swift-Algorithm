import Foundation

let n = Int(readLine()!)!
var stair = [Int]()
for _ in 0..<n {
    stair.append(Int(readLine()!)!)
}
// dp[i][0] : i번 칸으로 1계단 올라서 왔을 때 (1계단 오르는 건 2번 연속 x - 맨 처음 제외)
// dp[i][1] : i번 칸으로 2계단 올라서 왔을 때
var dp = Array(repeating: Array(repeating: 0, count: 2), count: n)
dp[0] = [stair[0], stair[0]] // 1번째 칸은 1계단,2계단 둘 다 동일
if n > 1 {
    // 2번째 칸만 1칸 연속 가능
    dp[1][0] = stair[0] + stair[1]
    dp[1][1] = stair[1]
    
    for i in 2..<n {
        dp[i][0] = dp[i-1][1] + stair[i] // 이전 계단으로 2칸 점프했을 경우에만 현재 계단으로 1칸 점프 가능
        dp[i][1] = max(dp[i-2][0], dp[i-2][1]) + stair[i] // 현재 계단으로 2칸 점프는 상관 없이 2칸 전의 계단에서 최대값으로
    }
}
print(max(dp[n-1][0], dp[n-1][1]))