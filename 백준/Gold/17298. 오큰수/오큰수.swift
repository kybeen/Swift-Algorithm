import Foundation

let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map { Int($0)! }
var result = [Int](repeating: -1, count: n)
var stk = [Int]()

for i in 0..<n {
    while !stk.isEmpty && arr[stk.last!] < arr[i] {
        result[stk.popLast()!] = arr[i]
    }
    stk.append(i)
}
print(result.map { String($0) }.joined(separator: " "))