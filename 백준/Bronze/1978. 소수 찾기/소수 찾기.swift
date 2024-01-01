import Foundation

let n = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map{ Int($0)! }

var primeNums = [Bool](repeating: true, count: 1001)

primeNums[0] = false
primeNums[1] = false
for i in 3...1000 {
    for j in 2...i/2+1 {
        if i % j == 0 {
            primeNums[i] = false
            break
        }
    }
}

var result = 0
for num in nums {
    if primeNums[num] {
        result += 1
    }
}
print(result)