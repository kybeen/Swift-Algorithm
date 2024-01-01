import Foundation

let n = Int(readLine()!)!
if n == 0 {
    print(1)
} else {
    var result = 1
    for i in 1...n {
        result *= i
    }
    print(result)
}