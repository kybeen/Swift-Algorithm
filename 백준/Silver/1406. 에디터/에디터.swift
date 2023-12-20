import Foundation

var left = Array(readLine()!)
var right = [Character]()
let m = Int(readLine()!)!

for _ in 0..<m {
    let command = readLine()!
    switch command.first! {
    case "L":
        if !left.isEmpty {
            right.append(left.removeLast())
        }
    case "D":
        if !right.isEmpty {
            left.append(right.removeLast())
        }
    case "B":
        if !left.isEmpty {
            left.removeLast()
        }
    case "P":
        left.append(command.last!)
    default:
        break
    }
}
print(String(left) + String(right.reversed()))