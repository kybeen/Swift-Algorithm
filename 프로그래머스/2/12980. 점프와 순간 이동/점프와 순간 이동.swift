import Foundation

func solution(_ n:Int) -> Int {
    var answer = 1
    var n = n
    
    while n > 1 {
        if n % 2 == 0 {
            n /= 2
        } else {
            n -= 1
            answer += 1
        }
    }

    return answer
}