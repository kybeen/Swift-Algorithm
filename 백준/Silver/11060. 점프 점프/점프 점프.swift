import Foundation

let N = Int(readLine()!)!
let A = readLine()!.split(separator: " ").map { Int($0)! }

// dp[i] : i번 칸으로 가기 위한 최소 점프 횟수
var dp = [Int](repeating: 0, count: N)
if N > 1 {
    for i in 1..<N {
        for j in 0..<i {
            // j번 칸이 맨 왼쪽에서부터 갈 수 있는 칸인지 확인해야 함 (갈 수 없는 위치라면 패스)
            if j > 0 && dp[j] == 0 {
                continue
            }
            // j번 칸에서 점프해서 갈 수 있는 거리라면 dp테이블에 최솟값으로 점프 횟수 갱신
            if j + A[j] >= i {
                if dp[i] == 0 {
                    dp[i] = dp[j] + 1
                } else {
                    dp[i] = min(dp[i], dp[j]+1)
                }
            }
        }
    }
}

if N > 1 && dp[N-1] == 0 {
    print(-1)
} else {
    print(dp[N-1])
}