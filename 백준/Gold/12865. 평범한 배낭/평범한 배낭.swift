let NK = readLine()!.split(separator: " ").map { Int($0)! }
let (N, K) = (NK[0], NK[1])
var weight = [Int]()
var value = [Int]()
for _ in 0..<N {
    let WV = readLine()!.split(separator: " ").map { Int($0)! }
    weight.append(WV[0])
    value.append(WV[1])
}

// dp[i][j]: 0~i번 물건까지 고려했을 때 j무게까지 담을 수 있는 최대 가치
var dp = Array(repeating: Array(repeating: 0, count: K+1), count: N)
for j in 1...K {
    if j >= weight[0] {
        dp[0][j] = value[0]
    }
}
if N > 1 {
    for i in 1..<N {
        for j in 1...K {
            if j >= weight[i] {
                dp[i][j] = max(dp[i-1][j], dp[i-1][j-weight[i]] + value[i])
            } else {
                dp[i][j] = dp[i-1][j]
            }
        }
    }
}
print(dp[N-1][K])