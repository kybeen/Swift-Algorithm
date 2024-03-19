import Foundation

let NSM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NSM[0]
let S = NSM[1]
let M = NSM[2]
// volumes[i] : i번째 곡을 연주하기 전에 바꿀 수 있는 볼륨
let volumes = readLine()!.split(separator: " ").map { Int($0)! }

// dp[i][j] : i번 곡까지 연주했을 때, j 볼륨으로 연주 가능한지 여부
var dp = [[Bool]](repeating: [Bool](repeating: false, count: M+1), count: N)

// 시작 볼륨을 기준으로 첫 번째 곡을 연주했을 때 볼륨을 키운 경우와 줄인 경우를 체크
if 0...M ~= S + volumes[0] {
    dp[0][S+volumes[0]] = true
}
if 0...M ~= S - volumes[0] {
    dp[0][S-volumes[0]] = true
}
if N > 1 {
    for i in 1..<N {
        for v in 0...M {
            // 이전 곡에서 현재 곡의 volumes[i] 값 만큼 볼륨을 올리거나 줄일 수 있다면 true 처리
            if 0...M ~= v - volumes[i] {
                if dp[i-1][v-volumes[i]] {
                    dp[i][v] = true
                }
            }
            if 0...M ~= v + volumes[i] {
                if dp[i-1][v+volumes[i]] {
                    dp[i][v] = true
                }
            }
        }
    }
}

// 마지막 곡까지 고려했을 때 최대 볼륨을 출력 (마지막 곡에서 가능한 볼륨이 없으면 -1 출력)
var result = -1
for v in 0...M {
    if dp[N-1][v] {
        result = v
    }
}
print(result)