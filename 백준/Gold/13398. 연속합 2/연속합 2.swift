import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{ Int($0)! }

// dp[0][i] : 제거하지 않는 경우
// dp[1][i] : 제거한 원소가 있는 경우
var dp = [[Int]](repeating: [Int](repeating: 0, count: n), count: 2)
dp[0][0] = arr[0]

var result = arr[0]

for i in 1..<n {
    dp[0][i] = max(arr[i], dp[0][i-1] + arr[i])
    // i원소가 제거되는 경우 VS 이전에 제거된 원소가 있는 경우
    dp[1][i] = max(dp[0][i-1], dp[1][i-1] + arr[i])
    
    result = max(result, dp[0][i], dp[1][i])
}

print(result)