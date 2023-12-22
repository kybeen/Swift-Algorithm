import Foundation

let word = Array(readLine()!)
var result = [Int](repeating: 0, count: 26)

for chr in word {
    let ascii = Int(UnicodeScalar(String(chr))!.value)
    result[ascii-97] += 1
}
print(result.map { String($0) }.joined(separator: " "))
