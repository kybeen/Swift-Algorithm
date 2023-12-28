import Foundation

let t = Int(readLine()!)!
for _ in 0..<t {
    let n = Int(readLine()!)!
    switch n {
    case 1:
        print(1)
    case 2:
        print(2)
    case 3:
        print(4)
    default:
        // dp[n] : n을 1,2,3의 합으로 나타내는 방법의 수
        var dp = [Int](repeating: 0, count: n+1)
        dp[1] = 1
        dp[2] = 2
        dp[3] = 4
        for i in 4...n {
            dp[i] = dp[i-1] + dp[i-2] + dp[i-3]
        }
        print(dp[n])
    }
}