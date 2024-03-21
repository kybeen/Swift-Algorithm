import Foundation

let nk = readLine()!.split(separator: " ").map { Int($0)! }
let n = nk[0]
let k = nk[1]
var coins = [Int]()
for _ in 0..<n {
    coins.append(Int(readLine()!)!)
}

// dp[i][j]: 0~i번 동전만 고려했을 때, 가치가 j가 되는 경우의 수
var dp = Array(repeating: Array(repeating: 0, count: k+1), count: n)

dp[0][0] = 1
// 0번 동전으로 만들 수 있는 금액에 대해 dp테이블의 0번 행을 채워줌
for j in 1...k {
    if j % coins[0] == 0 {
        dp[0][j] = 1
    }
}

if n > 1 {
    for i in 1..<n {
        dp[i][0] = 1 // 가치가 0이 되는 경우는 아무 동전도 사용하지 않은 1가지 경우
        for j in 1...k {
            if j >= coins[i] { // 현재 고려되는(i번) 동전을 사용할 수 있는 금액일 경우
                dp[i][j] = dp[i-1][j] &+ dp[i][j-coins[i]]
            } else {
                // 현재 고려되는 동전을 사용할 수 없는 경우는 dp[i-1]과 같음
                dp[i][j] = dp[i-1][j]
            }
        }
    }
}

print(dp[n-1][k])