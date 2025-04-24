import Foundation

let NM = readLine()!.split(separator: " ").map({ Int($0)! })
let (N, M) = (NM[0], NM[1])
let A = readLine()!.split(separator: " ").map({ Int($0)! })

var answer = 0
var sum = 0
var right = 0
for left in 0..<N {
    while sum < M && right < N {
        sum += A[right]
        right += 1
    }
    if sum == M {
        answer += 1
    }
    sum -= A[left]
}
print(answer)