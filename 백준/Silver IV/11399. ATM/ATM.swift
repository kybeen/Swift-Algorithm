import Foundation

let N = Int(readLine()!)!
let P = readLine()!.split(separator: " ").map { Int($0)! }

var waitings = [Int]()
var time = 0
for p in P.sorted(by: <) {
    time += p
    waitings.append(time)
}

print(waitings.reduce(0, +))