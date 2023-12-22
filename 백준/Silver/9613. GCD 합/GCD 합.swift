import Foundation

// 최대공약수 (유클리드 호제법)
func gcd(_ a: Int, _ b: Int) -> Int {
    if b == 0 {
        return a
    } else {
        return gcd(b, a%b)
    }
}

let t = Int(readLine()!)!

for _ in 0..<t {
    let testCase = readLine()!.split(separator: " ").map { Int($0)! }
    let numCnt = testCase[0]
    var nums = [Int]()
    var result: Int = 0
    for i in 1..<testCase.count {
        nums.append(testCase[i])
    }
    
    for i in 0..<nums.count {
        for j in (i+1)..<nums.count {
            result += gcd(nums[i], nums[j])
        }
    }
    
    print(result)
}