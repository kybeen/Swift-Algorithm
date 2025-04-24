import Foundation

let NS = readLine()!.split(separator: " ").map({ Int($0)! })
let (N, S) = (NS[0], NS[1])
let arr = readLine()!.split(separator: " ").map({ Int($0)! })

var answer = Int.max
var sum = 0
var right = 0
for left in 0..<N {
    while sum < S && right < N {
        sum += arr[right]
        right += 1
    }
    if sum >= S {
        let length = right - left
        answer = min(answer, length)
    }
    sum -= arr[left]
}
print(answer == Int.max ? 0 : answer)