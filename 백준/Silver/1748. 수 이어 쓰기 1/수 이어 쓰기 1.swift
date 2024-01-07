import Foundation

let n = Int(readLine()!)!

var k = 1
while true {
    if n < Int(pow(Double(10), Double(k))) {
        break
    }
    k += 1
}

var result = 0
for i in 1...k {
    if i == k {
        result += i * (n - Int(pow(Double(10), Double(i-1))) + 1)
    } else {
        result += i * (9 * Int(pow(Double(10), Double(i-1))))
    }
}
print(result)