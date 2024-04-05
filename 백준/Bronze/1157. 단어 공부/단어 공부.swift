import Foundation

let word = Array(readLine()!)
var dict = [String: Int]()
var maxCnt = 0 // 가장 많은 알파벳의 개수
// 대문자로 변환해서 딕셔너리에 카운트
for chr in word {
    let upper = chr.uppercased()
    if dict[upper] == nil {
        dict[upper] = 1
    } else {
        dict[upper]! += 1
    }
    maxCnt = max(maxCnt, dict[upper]!)
}

var result = [String]()
for (key, value) in dict {
    if value == maxCnt {
        result.append(key)
    }
}

if result.count == 1 {
    print(result[0])
} else {
    print("?")
}