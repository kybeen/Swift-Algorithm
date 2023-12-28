import Foundation

let n = Int(readLine()!)! // 구매하려고 하는 카드 개수 N
let cards = readLine()!.split(separator: " ").map { Int($0)! }
// dp[n]: 카드 n개를 갖기 위해 지불해야 하는 최대값
var dp = cards
dp.insert(0, at: 0)

if n == 1 {
    print(dp[1])
} else {
    for i in 2...n {
        dp[i] = max(dp[i], dp[i-1]+1)
        for j in 1...i {
            dp[i] = max(dp[i], dp[i-j]+cards[j-1])
        }
    }
    print(dp[n])
}