import Foundation

func solution(_ n:Int) -> Int {
    var n = n
    var result = 0
    
    while n != 0 {
        if n % 2 == 0 {
            n /= 2
        } else {
            n -= 1
            n /= 2
            result += 1
        }
    }
    
    return result
}