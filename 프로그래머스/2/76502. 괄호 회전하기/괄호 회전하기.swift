import Foundation

func solution(_ s:String) -> Int {
    let s = s.map { String($0) }
    
    func isValidBracket(_ start: Int, _ str: [String]) -> Bool {
        var stk = [String]()
        let length = str.count
        var idx = start % length
        
        for _ in 0..<length {
            idx = (idx % length)
            
            let bracket = str[idx]
            if ["(", "[", "{"].contains(bracket) {
                stk.append(bracket)
            } else if [")", "]", "}"].contains(bracket) {
                if stk.isEmpty {
                    return false
                } else if let last = stk.last {
                    switch last {
                        case "(" where bracket == ")":
                            _ = stk.popLast()
                        case "[" where bracket == "]":
                            _ = stk.popLast()
                        case "{" where bracket == "}":
                            _ = stk.popLast()
                        default:
                            return false
                    }
                }
            }
            
            idx += 1
        }
        
        return stk.isEmpty ? true : false
    }
    
    var result = 0
    for x in 0..<s.count {
        if isValidBracket(x, s) {
            result += 1
        }
    }
    
    return result
}