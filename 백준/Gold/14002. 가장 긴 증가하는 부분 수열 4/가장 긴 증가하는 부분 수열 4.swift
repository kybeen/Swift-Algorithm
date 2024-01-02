import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{ Int($0)! }

// dp[n]: 수열의 인덱스 n번 숫자로 끝나는 (가장 긴 부분 수열의 길이, 부분 수열)
var dp = [(Int, [Int])]()
dp.append((0, []))
for i in 1...n {
    dp.append((1, [arr[i-1]]))
}

if n > 1 {
    for i in 2...n {
        for j in 1...i {
            if arr[i-1] > arr[j-1] {
                if dp[i].0 < dp[j].0 + 1 {
                    dp[i].0 = dp[j].0 + 1
                    dp[i].1 = dp[j].1
                    dp[i].1.append(arr[i-1])
                }
            }
        }
    }
}

var result: (Int, [Int]) = (0, [])
for i in 1...n {
    if dp[i].0 > result.0 {
        result = dp[i]
    }
}
print(result.0)
print(result.1.map{ String($0) }.joined(separator: " "))