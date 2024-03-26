import Foundation

let strA = readLine()!.map { String($0) }
let strB = readLine()!.map { String($0) }

let lenA = strA.count
let lenB = strB.count

// dp[i][j]: A문자열의 0~i번 문자까지 고려했을 때, B문자열의 0~j번 문자까지의 LCS 길이
var dp = Array(repeating: Array(repeating: 0, count: lenB+1), count: lenA+1)

for i in 1..<lenA+1 {
    for j in 1..<lenB+1 {
        if strA[i-1] == strB[j-1] {
            dp[i][j] = dp[i-1][j-1] + 1
        } else {
            dp[i][j] = max(dp[i-1][j], dp[i][j-1])
        }
    }
}

print(dp[lenA][lenB])