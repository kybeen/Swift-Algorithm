import Foundation

let N = Int(readLine()!)!
var meetings = [[Int]]()
for _ in 0..<N {
    meetings.append(readLine()!.split(separator: " ").map { Int($0)! })
}

// 종료 시간이 빠른 순서대로 정렬
// 종료 시간이 같을 경우에는 시작 시간이 더 빠른 순서대로 정렬
meetings.sort { (a: [Int], b: [Int]) -> Bool in
    if a[1] == b[1] {
        return a[0] < b[0]
    } else {
        return a[1] < b[1]
    }
}

var result = 1
var finishTime = meetings[0][1] // 현재 회의의 종료 시간
for i in 1..<meetings.count {
    // 현재 회의 종료 이후에 시작할 수 있는 회의라면 result 1 카운트
    if finishTime <= meetings[i][0] {
        result += 1
        finishTime = meetings[i][1]
    }
}
print(result)