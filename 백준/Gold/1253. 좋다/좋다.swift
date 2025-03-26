let N = Int(readLine()!)!
let A = readLine()!.split(separator: " ").map({ Int($0)! }).sorted()
var answer = 0

if N > 2 {
    nowLoop: for now in 0..<N {
        var left = 0
        var right = N-1
        while left < right {
            if left == now {
                left += 1
            } else if right == now {
                right -= 1
            } else {
                let LRSum = A[left] + A[right]
                if LRSum > A[now] {
                    right -= 1
                } else if LRSum < A[now] {
                    left += 1
                } else {
                    answer += 1
                    continue nowLoop
                }
            }
        }
    }
}

print(answer)