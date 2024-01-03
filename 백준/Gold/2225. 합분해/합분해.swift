import Foundation

let nums = readLine()!.split(separator: " ").map{ Int($0)! }
let n = nums[0]
let k = nums[1]

// dp[i][j] : 정수 j개를 더해서 그 합이 i가 되는 경우의 수
var dp = [[Int]](repeating: [Int](repeating: 0, count: k+1), count: n+1)
dp[0] = [Int](repeating: 1, count: k+1)
dp[0][0] = 0
for i in 1...n {
    dp[i][1] = 1
}

if k > 1 {
    for i in 1...n {
        for j in 2...k {
            dp[i][j] = (dp[i-1][j] + dp[i][j-1]) % 1000000000
        }
    }
}

print(dp[n][k])