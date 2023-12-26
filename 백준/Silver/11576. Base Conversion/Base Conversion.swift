import Foundation

let inputValue = readLine()!.split(separator: " ").map { Int($0)! }
let a = inputValue[0] // 미래세계 진법
let b = inputValue[1] // 정이가 사용하는 진법
let m = Int(readLine()!)! // A진법으로 나타낸 숫자의 자리수의 개수
var nums = readLine()!.split(separator: " ").map { Int($0)! } // A진법을 이루고 있는 숫자 m개

// a진법 수 구하기
var aNum = 0
nums.reverse()
for i in 0..<m {
    aNum += nums[i] * Int(pow(Double(a), Double(i)))
}

// a -> b 진법 변환
var result = [Int]()
while aNum != 0 {
    result.append(aNum % b)
    aNum = aNum / (b)
}

print(result.reversed().map { String($0) }.joined(separator: " "))