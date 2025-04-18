import Foundation

let NS = readLine()!.split(separator: " ").map({ Int($0)! })
let (N, S) = (NS[0], NS[1])
let arr = readLine()!.split(separator: " ").map({ Int($0)! })

var nowSum = 0
for num in arr {
    nowSum += num
}

var answer = Int.max
var left = 0
var right = 0
nowSum = 0

while true {
    if nowSum >= S {
        answer = min(answer, right - left)
        nowSum -= arr[left]
        left += 1
    } else {
        if right == N { break }
        nowSum += arr[right]
        right += 1
    }
}

print(answer == Int.max ? 0 : answer)