import Foundation

let value = readLine()!.components(separatedBy: " ").map { Int($0)! }
let n = value[0]
let k = value[1]
var arr = [Int](1...n)

var removeIdx = k-1
var result = [Int]()
for _ in 0..<n {
    result.append(arr.remove(at: removeIdx))
    if !arr.isEmpty {
        removeIdx += k-1
        removeIdx = removeIdx % arr.count
    }
}
print("<", terminator: "")
for r in result {
    if r == result.last! {
        print(r, terminator: "")
    } else {
        print(r, terminator: ", ")
    }
}
print(">")