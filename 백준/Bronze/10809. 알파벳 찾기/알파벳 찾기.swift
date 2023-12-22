import Foundation

let word = Array(readLine()!)
var result = [Int](repeating: -1, count: 26)

for i in 0..<word.count {
    let alphabet = String(word[i])
    let index = Int(UnicodeScalar(alphabet)!.value) - 97
    if result[index] == -1 {
        result[index] = i
    }
}
print(result.map { String($0) }.joined(separator: " "))