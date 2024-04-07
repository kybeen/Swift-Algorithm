import Foundation

let N = Int(readLine()!)!
var P = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: <)
var result = 0
var temp = 0
for i in 0..<N {
    temp += P[i]
    result += temp
}
print(result)