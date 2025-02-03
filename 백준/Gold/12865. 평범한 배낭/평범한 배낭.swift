let NK = readLine()!.split(separator: " ").map { Int($0)! }
let (N, K) = (NK[0], NK[1])
var weight = [Int]()
var value = [Int]()
for _ in 0..<N {
    let WV = readLine()!.split(separator: " ").map { Int($0)! }
    let (W, V) = (WV[0], WV[1])
    weight.append(W)
    value.append(V)
}

var dp = Array(repeating: Array(repeating: 0, count: K+1), count: N)
for j in 0...K {
    if weight[0] <= j {
        dp[0][j] = value[0]
    }
}

if N > 1 {
    for i in 1..<N {
        for j in 1...K {
            if j - weight[i] >= 0 {
                dp[i][j] = max(dp[i-1][j], dp[i-1][j-weight[i]] + value[i])
            } else {
                dp[i][j] = dp[i-1][j]
            }
        }
    }
}
print(dp[N-1][K])