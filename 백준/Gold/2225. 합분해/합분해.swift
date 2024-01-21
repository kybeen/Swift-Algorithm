import Foundation

let nums = readLine()!.split(separator: " ").map{ Int($0)! }
let N = nums[0]
let K = nums[1]

// dp[i][j] : 정수 i개를 더해서 합이 j가 되는 경우의 수
var dp = [[Int]](repeating: [Int](repeating: 0, count: N+1), count: K+1)
dp[1] = [Int](repeating: 1, count: N+1)
for i in 0...K {
    dp[i][0] = 1
}

if K > 1 {
    for i in 2...K {
        for j in 1...N {
            dp[i][j] = (dp[i-1][j] + dp[i][j-1]) % 1000000000
        }
    }
}
print(dp[K][N] % 1000000000)