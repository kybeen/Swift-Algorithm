import Foundation

let K = Int(readLine()!)!
var result = 0
var cache = [Int]()
for _ in 0..<K {
    let num = Int(readLine()!)!
    if num == 0 {
        result -= cache.popLast()!
    } else {
        result += num
        cache.append(num)
    }
}
print(result)