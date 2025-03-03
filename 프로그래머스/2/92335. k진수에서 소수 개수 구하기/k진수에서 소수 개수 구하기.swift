import Foundation

func isPrime(_ num: Int) -> Bool {
    if num < 2 { return false }
    
    for i in 2..<Int(sqrt(Double(num)) + 1) {
        if num % i == 0 {
            return false
        }
    }
    return true
}

func getBaseNum(_ num: Int, _ k: Int) -> String {
    var num = num
    var result = ""
    while num > 0 {
        result += String(num % k)
        num /= k
    } 
    return String(result.reversed())
}

func solution(_ n:Int, _ k:Int) -> Int {
    let baseNum = getBaseNum(n, k)
    let nonZeroNums = baseNum.components(separatedBy: "0").filter({ $0 != "" })
    
    // print(nonZeroNums)
    
    var answer = 0
    for nonZeroNum in nonZeroNums {
        if isPrime(Int(nonZeroNum)!) {
            answer += 1
        }
    }
    
    return answer
}