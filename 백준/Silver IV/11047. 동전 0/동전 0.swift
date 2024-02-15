import Foundation

let NK = readLine()!.split(separator: " ").map { Int($0)! }
let N = NK[0]
var K = NK[1]
var A = [Int]()
for _ in 0..<N {
    A.append(Int(readLine()!)!)
}
A.sort(by: >)

var result = 0
for coin in A {
    guard K != 0 else { break }
    
    if coin <= K {
        result += K / coin
        K = K % coin
    }
}
print(result)