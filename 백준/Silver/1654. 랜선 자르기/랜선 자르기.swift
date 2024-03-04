import Foundation

let KN = readLine()!.split(separator: " ").map { Int($0)! }
let K = KN[0]
let N = KN[1]
var lines = [Int]()
for _ in 0..<K {
    lines.append(Int(readLine()!)!)
}

// N개 이상으로 쪼갤 수 있는지 확인
func isDividable(length: Int) -> Bool {
    var count = 0
    for line in lines {
        count += (line / length)
    }
    
    if count >= N {
        return true
    } else {
        return false
    }
}

var start = 1
var end = lines.max()! // 가장 긴 랜선의 길이
var result = 0

// 이분 탐색
while start <= end {
    let mid = (start + end) / 2
    
    // mid 길이로 N개 이상 쪼개진다면
    if isDividable(length: mid) {
        result = max(result, mid)
        start = mid + 1
    } else { // 쪼개지지 않는다면
        end = mid - 1
    }
}

print(result)