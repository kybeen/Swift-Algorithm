import Foundation

let S = Array(readLine()!)
var result = [Int](repeating: -1, count: 26)

for i in 0..<S.count {
    var idx = Int(UnicodeScalar(String(S[i]))!.value) - 97
    if result[idx] == -1 {
        result[idx] = i
    }
}
print(result.map { String($0) }.joined(separator: " "))