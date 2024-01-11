import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{ Int($0)! }

// dp[i] : i까지 왔을 때 가장 큰 증가하는 부분 수열의 합
var dp = [Int](repeating: 0, count: n)
dp[0] = arr[0]
if n > 1 {
    for i in 1..<n {
        for j in 0..<i {
            if arr[j] < arr[i] {
                dp[i] = max(dp[i], dp[j])
            }
        }
        dp[i] += arr[i]
    }
}

print(dp.max()!)