import Foundation

let NM = readLine()!.split(separator: " ").map({ Int($0)! })
let (N, M) = (NM[0], NM[1])
let A = readLine()!.split(separator: " ").map({ Int($0)! })
var prefixSum = Array(repeating: 0, count: N+1)
var sum = 0
for i in 0..<N {
    sum += A[i]
    prefixSum[i+1] = sum
}
//print("prefixSum \(prefixSum)")

var answer = 0
for i in 1...N {
    for j in i...N {
        if prefixSum[j] - prefixSum[i-1] == M {
            answer += 1
        } else if prefixSum[j] - prefixSum[i-1] > M {
            // 부분합이 M보다 커지는 구간부터는 j를 더 확인할 필요 x
            break
        }
    }
}
print(answer)