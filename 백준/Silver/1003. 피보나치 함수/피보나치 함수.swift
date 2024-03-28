import Foundation

let T = Int(readLine()!)!
for _ in 0..<T {
    let N = Int(readLine()!)!
    // dp[i][0]: fibonacci(i) 호출 시 0의 출력 횟수
    // dp[i][1]: fibonacci(i) 호출 시 1의 출력 횟수
    var dp = Array(repeating: Array(repeating: 0, count: 2), count: 41)
    dp[0] = [1, 0]
    dp[1] = [0, 1]
    if N > 1 {
        for i in 2...N {
            dp[i][0] = dp[i-1][0] + dp[i-2][0]
            dp[i][1] = dp[i-1][1] + dp[i-2][1]
        }
    }
    
    print("\(dp[N][0]) \(dp[N][1])")
}