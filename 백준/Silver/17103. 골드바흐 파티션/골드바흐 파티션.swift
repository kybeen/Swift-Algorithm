import Foundation

// 소수 배열 생성 함수 (에라토스테네스의 체)
func isPrime(num: Int) -> [Bool] {
    var check = [Bool](repeating: true, count: num+1)
    check[0] = false
    check[1] = false
    
    // 2부터 num의 제곱근까지의 배수들을 false처리
    for i in 2..<Int(sqrt(Double(num)))+1 {
        if check[i] == true {
            var j = 2
            while i*j <= num {
                check[i*j] = false
                j += 1
            }
        }
    }
    return check
}

let t = Int(readLine()!)!
for _ in 0..<t {
    let n = Int(readLine()!)!
    var result: Int = 0
    let primeArr: [Bool] = isPrime(num: n)
    for i in 1...n/2 {
        if primeArr[i] == true && primeArr[n-i] == true {
            result += 1
        }
    }
    print(result)
}