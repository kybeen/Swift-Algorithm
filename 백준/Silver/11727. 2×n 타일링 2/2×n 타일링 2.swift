import Foundation

let n = Int(readLine()!)!
if n == 1 {
    print(1)
} else if n == 2 {
    print(3)
} else {
    var dp = [Int](repeating: 0, count: n+1)
    dp[1] = 1
    dp[2] = 3
    for i in 3...n {
        dp[i] = (dp[i-1] + dp[i-2]*2) % 10007
    }
    print(dp[n])
}