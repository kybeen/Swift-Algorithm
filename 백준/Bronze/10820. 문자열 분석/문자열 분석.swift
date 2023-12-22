import Foundation

while let input = readLine() {
    let sentence = Array(input)
    var lower: Int = 0 // 소문자
    var upper: Int = 0 // 대문자
    var number: Int = 0 // 숫자
    var space: Int = 0 // 공백
    
    for chr in sentence {
        if chr.isLowercase {
            lower += 1
        } else if chr.isUppercase {
            upper += 1
        } else if chr.isNumber {
            number += 1
        } else if chr.isWhitespace {
            space += 1
        }
    }
    print(lower, upper, number, space, separator: " ")
}