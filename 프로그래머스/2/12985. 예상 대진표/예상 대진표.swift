import Foundation

func solution(_ n:Int, _ a:Int, _ b:Int) -> Int {
    var answer = 0
    
    var nowA = a
    var nowB = b
    
    // 짝수면 나누기 2
    // 홀수면 1더하고 나누기 2
    func nextRound(num: Int) -> Int {
        if num % 2 == 0 {
            return num / 2
        } else {
            return (num + 1) / 2
        }
    }
    
    while nowA != nowB {
        nowA = nextRound(num: nowA)
        nowB = nextRound(num: nowB)
        
        answer += 1
    }

    return answer
}