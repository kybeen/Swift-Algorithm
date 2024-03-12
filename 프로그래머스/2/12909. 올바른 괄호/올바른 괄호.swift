import Foundation

func solution(_ s:String) -> Bool
{
    var result = true
    var stack = [Character]()
    
    for str in s {
        // 열리는 괄호라면 스택에 추가
        if str == "(" {
            stack.append(str)
        } else {
            // 닫히는 괄호일 때 스택이 비어 있으면 false
            if stack.isEmpty {
                result = false
                break
            } else {
                // 스택이 비어 있지 않으면 하나 제거
                _ = stack.popLast()
            }
        }
    }
    // 마지막에 스택에 남아 있는 괄호가 있다면 false
    if !stack.isEmpty {
        result = false
    }
    
    return result
}