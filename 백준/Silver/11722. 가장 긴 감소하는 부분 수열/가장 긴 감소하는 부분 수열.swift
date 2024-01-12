import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{ Int($0)! }

// dp[i] : i인덱스수로 끝나는 가장 긴 감소하는 부분 수열의 길이
var dp = [Int](repeating: 1, count: n)
if n > 1 {
    for i in 1..<n {
        for j in 0..<i {
            if arr[j] > arr[i] {
                dp[i] = max(dp[i], dp[j]+1)
            }
        }
    }
}

print(dp.max()!)