import Foundation

let strA = readLine()!.map { String($0) }
let strB = readLine()!.map { String($0) }

let lenA = strA.count
let lenB = strB.count

// dp[i][j]: A문자열의 0~i번 문자까지 고려했을 때, B문자열의 0~j번 문자까지의 LCS 길이
var dp = Array(repeating: Array(repeating: 0, count: lenB+1), count: lenA+1)
var lcs = ""

for i in 1..<lenA+1 {
    for j in 1..<lenB+1 {
        if strA[i-1] == strB[j-1] {
            dp[i][j] = dp[i-1][j-1] + 1
        } else {
            dp[i][j] = max(dp[i-1][j], dp[i][j-1])
        }
    }
}

// LCS 찾기
/*
 LCS 길이랑 비교하며 dp를 역순으로 탐색
 현재 자리가 lcs길이랑 같으면서 dp[i-1][j]와 dp[i][j-1]값이 현재 자리보다 1 작으면 LCS문자임
 */
var temp = dp[lenA][lenB]
for i in stride(from: lenA, through: 1, by: -1) {
    for j in stride(from: lenB, through: 1, by: -1) {
        if (dp[i][j] == temp) && (dp[i-1][j] == temp-1) && (dp[i][j-1] == temp-1) {
            lcs += strA[i-1]
            temp -= 1
            break // lcs 문자를 찾았으면 현재 행을 더 볼 필요가 없음
        }
    }
}

print(dp[lenA][lenB])
if lcs.count > 0 {
    print(String(lcs.reversed()))
}