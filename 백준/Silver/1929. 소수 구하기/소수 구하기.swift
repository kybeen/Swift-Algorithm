import Foundation

let nums = readLine()!.split(separator: " ").map{ Int($0)! }

// 에라토스테네스의 채
var prime = [Bool](repeating: true, count: 1000001)
prime[0] = false
prime[1] = false
for i in 2..<Int(sqrt(Double(1000001)))+1 {
    var j = 2
    if prime[i] == true {
        while i*j < 1000001 {
            prime[i*j] = false
            j += 1
        }
    }
}

for i in nums[0]...nums[1] {
    if prime[i] == true {
        print(i)
    }
}