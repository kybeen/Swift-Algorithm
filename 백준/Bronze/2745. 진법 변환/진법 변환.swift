import Foundation

let inputValue = readLine()!.split(separator: " ")
var n = Array(inputValue[0])
let b = Int(inputValue[1])!

var result = 0
n.reverse()
for i in 0..<n.count {
    if n[i].isNumber {
        let value = Int(String(n[i]))!
        result += value * Int(pow(Double(b), Double(i)))
    } else {
        let numValue = Int(UnicodeScalar(String(n[i]))!.value) - 55
        result += numValue * Int(pow(Double(b), Double(i)))
    }
}

print(result)