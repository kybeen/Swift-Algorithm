import Foundation

let NK = readLine()!.split(separator: " ").map { Int($0)! }
let N = NK[0]
var K = NK[1]
var A = [Int]()
for _ in 0..<N {
    A.append(Int(readLine()!)!)
}

var result = 0
for i in stride(from: N-1, through: 0, by: -1) {
    result += (K / A[i])
    K %= A[i]
}
print(result)