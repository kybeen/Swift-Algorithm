import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{ Int($0)! }

if n == 1 {
    print(1)
} else {
    // dp[n] : n번 인덱스까지 가장 긴 증가하는 부분 수열의 길이
    var dp = [Int](repeating: 1, count: n+1)
    for i in 2...n {
        for j in 1..<i {
            if arr[i-1] > arr[j-1] { // 증가하는 관계라면 가장 긴 증가하는 부분 수열의 길이를 확인하고 갱신
                dp[i] = max(dp[i], dp[j]+1)
            }
        }
    }
    print(dp.max()!)
}