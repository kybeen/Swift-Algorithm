import Foundation

let N = Int(readLine()!)!
var T = [Int]()
var P = [Int]()
for _ in 0..<N {
    let TP = readLine()!.split(separator: " ").map { Int($0)! }
    T.append(TP[0])
    P.append(TP[1])
}

// dp[i] : i일에 상담을 했을 때 받을 수 있는 최대 금액
var dp = [Int](repeating: 0, count: N)

// 상담 기간이 퇴사일을 넘어가는 경우 0으로 처리
for i in 0..<N {
    if i+T[i]-1 >= N {
        dp[i] = 0
    } else {
        dp[i] = P[i]
    }
}

for i in 1..<N {
    if dp[i] == 0 {
        continue
    } else {
        for j in 0..<i {
            // 상담을 진행해도 i날에 지장이 없는 일수라면 최대값 비교
            if j+T[j]-1 < i {
                dp[i] = max(dp[i], dp[j]+P[i])
            }
        }
    }
}

print(dp.max()!)