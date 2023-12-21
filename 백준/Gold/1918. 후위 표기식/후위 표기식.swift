import Foundation

let expression = Array(readLine()!)
var result = [Character]()

var stk = [Character]() // 스택에는 + - * / ( ) 만 들어감
for exp in expression {
    // 글자라면
    if exp.isLetter {
        result.append(exp)
    } else {
        switch exp {
        case "(":
            stk.append(exp)
        case "*", "/":
            while !stk.isEmpty && (stk.last! ==  "*" || stk.last! == "/") {
                result.append(stk.popLast()!)
            }
            stk.append(exp)
        case "+", "-":
            while !stk.isEmpty && stk.last! != "(" {
                result.append(stk.popLast()!)
            }
            stk.append(exp)
        case ")":
            // 닫는 괄호가 나오면 여는 괄호가 나올 때까지 스택의 연산들을 모두 후위 표기식으로 추가
            while !stk.isEmpty && stk.last! != "(" {
                result.append(stk.popLast()!)
            }
            _ = stk.popLast()! // 스택에 남은 "(" 처리
        default:
            break
        }
    }
}

while !stk.isEmpty {
    let s = stk.popLast()!
    if s != "(" {
        result.append(s)
    }
}

print(result.map { String($0) }.joined(separator: ""))