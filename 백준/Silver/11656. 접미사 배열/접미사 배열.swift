import Foundation

let str = Array(readLine()!)
var tails = [String]()
for i in 0..<str.count {
    var tail = ""
    for j in i..<str.count {
        tail += String(str[j])
    }
    tails.append(tail)
}

tails.sort()
print(tails.joined(separator: "\n"))
