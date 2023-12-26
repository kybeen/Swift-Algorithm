import Foundation

let inputValue = readLine()!.split(separator: " ").map { Int($0)! }
var n = inputValue[0]
let b = inputValue[1]

var result = [String]()
if n == 0 {
    result.append("0")
} else {
    while n != 0 {
        let rest = n % b // 나머지
        n = n / b
        
        if rest >= 10 { // 10진법을 넘어가는 진법의 경우 알파벳으로 변환
            // A 아스키값 -> 65
            result.append(String(UnicodeScalar(rest + 55)!))
        } else {
            result.append(String(rest))
        }
    }
}

print(result.reversed().joined(separator: ""))