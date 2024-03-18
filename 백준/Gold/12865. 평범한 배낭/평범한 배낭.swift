import Foundation

let NK = readLine()!.split(separator: " ").map { Int($0)! }
let N = NK[0]
let K = NK[1]
var weight = [Int]()
var value = [Int]()
for _ in 0..<N {
    let WV = readLine()!.split(separator: " ").map { Int($0)! }
    weight.append(WV[0])
    value.append(WV[1])
}

// dp[i][j] : 0~i번 물건까지 고려했을 때, j무게로 담을 수 있는 최대 가치
var dp = [[Int]](repeating: [Int](repeating: 0, count: K+1), count: N)

// 0번 물건만 고려하는 경우에 대한 dp 테이블 먼저 채워준다.
for j in 0...K {
    if weight[0] <= j {
        dp[0][j] = value[0]
    }
}

if N > 1 {
    for i in 1..<N {
        for j in 1...K {
            // j가 i번 물건을 포함할 수 있는 무게라면
            if j-weight[i] >= 0 {
                dp[i][j] = max(dp[i-1][j-weight[i]] + value[i], dp[i-1][j])
            } else {
                // 포함할 수 없는 무게라면 i-1번 물건까지 고려한 경우의 같은 무게에 대한 값을 그대로 사용
                dp[i][j] = dp[i-1][j]
            }
        }
    }
}

print(dp[N-1][K])