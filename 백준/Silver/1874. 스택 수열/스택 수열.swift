import Foundation

let n = Int(readLine()!)!
var target = [Int]() // 만들고자 하는 수열
for _ in 0..<n {
    target.append(Int(readLine()!)!)
}

var stack = [Int]()
var result = [String]() // 결과 배열
var targetIdx = 0 // 원하는 수열을 만들기 위해 스택에 넣어야 하는 수에 대한 target 배열에서의 인덱스
for i in 1...n {
    stack.append(i)
    result.append("+")
    while targetIdx < n && stack.last == target[targetIdx] {
        result.append("-")
        stack.removeLast()
        targetIdx += 1
    }
}
if stack.isEmpty {
    for r in result {
        print(r)
    }
} else {
    print("NO")
}