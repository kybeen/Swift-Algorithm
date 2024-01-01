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
    let nums = readLine()!.split(separator: " ").map{ Int($0)! }
    print(lcm(nums[0], nums[1]))
}