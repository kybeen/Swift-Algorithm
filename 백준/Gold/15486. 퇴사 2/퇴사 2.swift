import Foundation

let N = Int(readLine()!)!
var T: [Int] = [0]
var P: [Int] = [0]
for _ in 0..<N {
    let TP = readLine()!.split(separator: " ").map { Int($0)! }
    T.append(TP[0])
    P.append(TP[1])
}

// dp[i]: i일에 받을 수 있는 최대 금액 (N일에 상담이 끝나는 경우를 고려해 N+1일까지 생각한다)
var dp = [Int](repeating: 0, count: N+2)

var maxValue = 0 // i일 전까지 가능한 최대 이익
for i in 0...N {
    dp[i] = max(dp[i], maxValue)
    maxValue = max(maxValue, dp[i])
    
    let nextIdx = i + T[i] // i일에 상담을 진행했을 때 상담이 끝난 다음 날
    // 기존의 nextIdx날의 최대 이익과 현재 날(i)에 상담을 진행했을 때의 이익을 비교해서 최대값 갱신
    if nextIdx <= N+1 {
        dp[nextIdx] = max(dp[nextIdx], dp[i] + P[i])
    }
}

print(max(dp[N], dp[N+1])) // N, N+1일 중 더 큰 값을 출력 (N일에 1일 짜리 상담이 있을 경우 N+1일의 값을 출력해야 한다.)