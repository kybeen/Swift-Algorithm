import Foundation

func gcd(_ a: Int, _ b: Int) -> Int {
    if b == 0 {
        return a
    } else {
        return gcd(b, a%b)
    }
}
func lcm(_ a: Int, _ b: Int) -> Int {
    return a*b / gcd(a, b)
}

let t = Int(readLine()!)!

for _ in 0..<t {
    let testCase = readLine()!.split(separator: " ").map{ Int($0)! }
    let m = testCase[0]
    let n = testCase[1]
    let x = testCase[2]
    let y = testCase[3]
    
    var now = x
    while true {
        if now > lcm(m, n) {
            print(-1)
            break
        }
        
        let left = (now % m == 0) ? m : now % m
        let right = (now % n == 0) ? n : now % n
        if left == x && right == y {
            print(now)
            break
        }
        now += m
    }
}