import Foundation

let N = Int(readLine()!)!
var T: [Int] = [0]
var P: [Int] = [0]
for _ in 0..<N {
    let TP = readLine()!.split(separator: " ").map { Int($0)! }
    T.append(TP[0])
    P.append(TP[1])
}

var dp = [Int](repeating: 0, count: N+2) // dp[i] : i일에 얻을 수 있는 최대 수익 (N일에 상담이 끝나는 경우도 고려해서 N+1일까지 확인)
var maxValue = 0
for i in 1...N {
    maxValue = max(maxValue, dp[i])
    dp[i] = maxValue
    let nextDay = i + T[i]
    if nextDay <= N+1 {
        dp[nextDay] = max(dp[nextDay], dp[i] + P[i])
    }
}

print(dp.max()!)