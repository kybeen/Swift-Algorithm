import Foundation

let nk = readLine()!.split(separator: " ").map { Int($0)! }
let n = nk[0]
let k = nk[1]
var coins = [Int]()
for _ in 0..<n {
    coins.append(Int(readLine()!)!)
}

// dp[i] : 가치가 i가 되는 최소 동전 개수
var dp = [Int](repeating: 10001, count: k+1)
dp[0] = 0

coins.sort(by: <)
// 각 동전을 하나만 쓰면 되는 경우 먼저 체크
for coin in coins {
    if coin <= k {
        dp[coin] = 1
    }
}

for coin in coins {
    if coin <= k {
        for i in coin...k {
            dp[i] = min(dp[i], dp[i-coin] + 1)
        }
    }
}

if dp[k] == 10001 {
    // 불가능한 경우
    print(-1)
} else {
    print(dp[k])
}