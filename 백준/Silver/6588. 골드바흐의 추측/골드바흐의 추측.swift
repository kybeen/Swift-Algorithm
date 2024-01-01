import Foundation

// 에라토스테네스의 채
var prime = [Bool](repeating: true, count: 1000001)
prime[0] = false
prime[1] = false
for i in 2..<Int(sqrt(Double(1000000))) + 1 {
    var j = 2
    if prime[i] == true {
        while i*j <= 1000000 {
            prime[i*j] = false
            j += 1
        }
    }
}

while true {
    let n = Int(readLine()!)!
    var isPossible = false
    if n == 0 {
        break
    } else {
        for i in stride(from: 3, through: n/2, by: 2) {
            if prime[i] && prime[n-i] {
                print("\(n) = \(i) + \(n-i)")
                isPossible = true
                break
            }
        }
        if isPossible == false {
            print("Goldbach's conjecture is wrong.")
        }
    }
}