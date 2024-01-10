import Foundation

let n = Int(readLine()!)!
var wines = [Int]()
for _ in 0..<n {
    wines.append(Int(readLine()!)!)
}

// dp[i] : i번째 포도주까지 있을 때 마실 수 있는 최대 양
// dp[i][0] : i번째 포도주를 마시지 않는 경우
// dp[i][1] : i번째 포도주를 연속 1잔째 마시는 경우
// dp[i][2] : i번째 포도주를 연속 2잔째 마시는 경우
var dp = [[Int]](repeating: [Int](repeating: 0, count: 3), count: n)
dp[0] = [0, wines[0], wines[0]]
if n > 1 {
    for i in 1..<n {
        dp[i][0] = max(dp[i-1][0], dp[i-1][1], dp[i-1][2])
        dp[i][1] = dp[i-1][0] + wines[i]
        dp[i][2] = dp[i-1][1] + wines[i]
    }
}

var result = 0
for i in 0..<n {
    result = max(result, dp[i].max()!)
}
print(result)