import Foundation

let NK = readLine()!.split(separator: " ").map { Int($0)! }
let N = NK[0]
var K = NK[1]

var digit = 1 // 자릿수
// 문자 개수의 범위
var kStart = 1
var kEnd = 0
// 해당 자릿수 숫자의 범위
var numStart = 1
var numEnd = 0

while digit < 10 {
    numStart = numEnd + 1
    numEnd = Int(pow(Double(10), Double(digit))) - 1
    kStart = kEnd + 1
    kEnd += (digit * 9 * Int(pow(Double(10), Double(digit-1))))
    
    // K가 해당하는 범위를 찾으면 반복문 종료
    if kStart...kEnd ~= K {
        break
    }
    
    digit += 1
}

var result = -1
var temp = kStart
// 해당 자릿수의 숫자들과 자릿수를 K와 비교해가며 찾아준다.
for num in numStart...numEnd {
    // N의 범위를 넘는 수가 나타나면 더 이상 확인하지 않음
    if num > N { break }
    
    // K가 현재 숫자에 해당하는 자리라면
    if K <= temp + digit - 1 {
        let arr = Array(String(num))
        result = Int(String(arr[K-temp]))!
        break
    } else {
        temp += digit
    }
}

print(result)