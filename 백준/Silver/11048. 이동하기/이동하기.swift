import Foundation

let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0]
let M = NM[1]
var miro = [[Int]]()
for _ in 0..<N {
    miro.append(readLine()!.split(separator: " ").map { Int($0)! })
}

// dp[i][j] : i,j 위치로 왔을 때 가져올 수 있는 사탕의 최대 개수
var dp = [[Int]](repeating: [Int](repeating: 0, count: M), count: N)
dp[0][0] = miro[0][0]

// 0번 열 채우기
if N > 1 {
    for i in 1..<N {
        dp[i][0] = dp[i-1][0] + miro[i][0]
    }
}
// 0번 행 채우기
if M > 1 {
    for j in 1..<M {
        dp[0][j] = dp[0][j-1] + miro[0][j]
    }
}
// 나머지 DP 테이블 채우기
if M > 1 && M > 1 {
    for i in 1..<N {
        for j in 1..<M {
            dp[i][j] = max(dp[i-1][j], dp[i][j-1], dp[i-1][j-1]) + miro[i][j]
        }
    }
}

print(dp[N-1][M-1])