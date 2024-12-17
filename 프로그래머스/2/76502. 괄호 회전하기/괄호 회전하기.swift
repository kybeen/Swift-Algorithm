import Foundation

func solution(_ s:String) -> Int {
    var brackets = s.map { String($0) }
    var cycleCount = s.count
    var result: Int = 0
    
    // 회전 (시작 인덱스 이동)
    while cycleCount > 0 {
        var stk = [String]()
        
        // 올바른 괄호 문자열 확인
        for idx in 0..<brackets.count {
            let now = brackets[idx]
            if !stk.isEmpty {
                let last = stk.last!
                switch last {
                case "(" where now == ")":
                    _ = stk.popLast()!
                case "{" where now == "}":
                    _ = stk.popLast()!
                case "[" where now == "]":
                    _ = stk.popLast()!
                default:
                    stk.append(now)
                }
            } else {
                stk.append(now)
            }
        }
        if stk.isEmpty {
            result += 1
        }
        stk = []
        cycleCount -= 1
        let first = brackets.removeFirst()
        brackets.append(first)
    }
    
    return result
}