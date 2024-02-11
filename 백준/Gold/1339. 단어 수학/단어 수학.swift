/*
 자릿수가 높을수록 큰 숫자가 들어가야 함
 - ABC + BDE = 110B + 100A + 10D + C + E
 => B:9, A:8, D:7, ... 이런 식으로
 */
import Foundation

let N = Int(readLine()!)!
var dict = [Character: Int]() // [문자: 자릿수값]
for _ in 0..<N {
    let word = Array(readLine()!)
    for i in 0..<word.count {
        if dict[word[i]] == nil {
            dict[word[i]] = Int(pow(10, Double(word.count-i-1)))
        } else {
            dict[word[i]]! += Int(pow(10, Double(word.count-i-1)))
        }
    }
}

var result = 0
var num = 9

// value가 큰 순서대로 9,8,7... 순서대로 큰 값부터 곱해서 더한다.
for (_, value) in dict.sorted(by: { $0.value > $1.value }) {
    result += value * num
    num -= 1
}
print(result)