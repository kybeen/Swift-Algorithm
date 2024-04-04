import Foundation

let T = Int(readLine()!)!

// P[i]는 P[i-2]와 P[i-3]의 합임 => 예제 보면 규칙이 보임
var P = [Int](repeating: 0, count: 101)
P[1] = 1
P[2] = 1
P[3] = 1
for i in 4...100 {
    P[i] = P[i-3] + P[i-2]
}

for _ in 0..<T {
    let N = Int(readLine()!)!
    print(P[N])
}