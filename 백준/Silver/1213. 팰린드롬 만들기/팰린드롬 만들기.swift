import Foundation

/*
 - A -> 유니코드 65
 - Z -> 유니코드 90
 print(UnicodeScalar("A").value) // 90
 print(UnicodeScalar(65)!) // A

 - 홀수개인 알파벳은 없거나 1개여야 함
 - 앞쪽 알파벳이 먼저 나와야 함
 */
let name = Array(readLine()!.map { String($0) })
var alphabetCount = [Int](repeating: 0, count: 26)

for chr in name {
    let idx = Int(UnicodeScalar(chr)!.value) - 65
    alphabetCount[idx] += 1
}

var result = ""
let length = name.count

var left = ""
for i in 0..<26 {
    let half = alphabetCount[i]/2
    let useCnt = half
    alphabetCount[i] -= (half * 2)
    
    let addStr = String(repeating: String(UnicodeScalar(i+65)!), count: useCnt)
    left += addStr
}
var right = String(left.reversed())

if alphabetCount.reduce(0, +) > 1 {
    // 홀수개인 알파벳이 1개보다 많다면 팰린드롬을 만들 수 없음
    print("I'm Sorry Hansoo")
} else {
    result += left
    for i in 0..<26 {
        if alphabetCount[i] == 1 {
            result += String(UnicodeScalar(i+65)!)
        }
    }
    result += right
    print(result)
}