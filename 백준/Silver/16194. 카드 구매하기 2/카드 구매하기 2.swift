import Foundation

let n = Int(readLine()!)!
let cards = readLine()!.split(separator: " ").map{ Int($0)! }
var dp = cards
dp.insert(0, at: 0)

// dp[n] : 카드 N개를 구매하기 위해 지불해야 하는 금액의 최솟값
for i in 1...n {
    for j in 1..<i {
        dp[i] = min(dp[i], dp[i-j] + cards[j-1])
    }
}
print(dp[n])