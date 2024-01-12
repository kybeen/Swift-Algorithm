import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{ Int($0)! }
let reversedArr = Array(arr.reversed())

// dp[0][i] : i인덱스로 끝나는 가장 긴 증가하는 부분 수열 길이
// dp[1][i] : 반대로 뒤집은 arr배열을 기준으로 i인덱스로 끝나는 가장 긴 증가하는 부분 수열 길이
var dp = [[Int]](repeating: [Int](repeating: 1, count: n), count: 2)
if n > 1 {
    for i in 1..<n {
        for j in 0..<i {
            if arr[j] < arr[i] {
                dp[0][i] = max(dp[0][i], dp[0][j]+1)
            }
            if reversedArr[j] < reversedArr[i] {
                dp[1][i] = max(dp[1][i], dp[1][j]+1)
            }
        }
    }
    
    dp[1].reverse()
}

var result = 0
for i in 0..<n {
    result = max(result, dp[0][i]+dp[1][i]-1)
}
print(result)