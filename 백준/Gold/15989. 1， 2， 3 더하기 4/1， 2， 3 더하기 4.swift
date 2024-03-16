import Foundation

let T = Int(readLine()!)!
for _ in 0..<T {
    let n = Int(readLine()!)!
    // dp[i][k] : 숫자 i를 1,2,3의 합으로 나타내는 방법들 중 k숫자로 끝나는 경우 (k -> 1,2,3)
    var dp = [[Int]](repeating: [Int](repeating: 0, count: 3), count: 10001)
    dp[1] = [1, 0, 0]
    dp[2] = [1, 1, 0]
    dp[3] = [2, 0, 1]
    if n <= 3 {
        print(dp[n].reduce(0, +))
    } else {
        for i in 4...n {
            dp[i][0] = dp[i-1][0] + dp[i-1][1] + dp[i-1][2]
            dp[i][1] = dp[i-2][1] + dp[i-2][2]
            dp[i][2] = dp[i-3][2]
        }
        print(dp[n].reduce(0, +))
    }
}