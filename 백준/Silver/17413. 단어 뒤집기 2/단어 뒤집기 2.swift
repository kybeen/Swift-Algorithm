import Foundation

extension String {
    subscript(idx: Int) -> Self? {
        guard (0..<count).contains(idx) else {
            return nil
        }
        let target = index(startIndex, offsetBy: idx)
        return String(self[target])
    }
}

let S = readLine()!.map { String($0) }
var result = ""
var reversedWord = ""

var isTag = false

for str in S {
    if isTag {
        if str == ">" {
            isTag = false
        }
        result += str
    } else {
        switch str {
        case " ":
            result += reversedWord.reversed()
            result += str
            reversedWord = ""
        case "<":
            isTag = true
            result += reversedWord.reversed()
            result += str
            reversedWord = ""
        default:
            reversedWord += str
        }
    }
}

result += reversedWord.reversed() // 마지막 단어 추가
print(result)