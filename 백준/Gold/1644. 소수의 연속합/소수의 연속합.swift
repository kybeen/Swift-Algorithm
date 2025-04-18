import Foundation

let N = Int(readLine()!)!
var isPrime = Array(repeating: true, count: N+1)
isPrime[0] = false
isPrime[1] = false

// 소수 만들기 (에라토스테네스의 체)
if N > 3 {
    for i in 2...Int(sqrt(Double(N))) {
        if isPrime[i] {
            var j = 2
            while i*j <= N {
                isPrime[i*j] = false
                j += 1
            }
        }
    }
}

var primeNums = [Int]() // 소수 배열
for (num, isPrimeNum) in isPrime.enumerated()  {
    if isPrimeNum {
        primeNums.append(num)
    }
}

// 연속합 구하기
var answer = 0
var left = 0
var right = 0
var sum = 0

while true {
    if sum == N {
        answer += 1
        sum -= primeNums[left]
        left += 1
    } else if sum < N {
        if right == primeNums.count { break }
        sum += primeNums[right]
        right += 1
    } else {
        sum -= primeNums[left]
        left += 1
    }
}

print(answer)