import Foundation

// 괄호 쌍의 정보
struct Bracket {
    let depth: Int
    let value: Int
}
// 잘못된 입력 시 종료
func terminate() {
    print(0)
    exit(0)
}

let bracketsString = Array(readLine()!)
var brackets: [Bracket] = []
var stack: [Character] = []
var nowDepth = 0

bracketsString.forEach { chr in
    if ["[", "("].contains(chr) {
        nowDepth += 1
        stack.append(chr)
    } else {
        if let last = stack.last {
            switch last {
            case "[" where chr == "]":
                calculateBracket(with: Bracket(depth: nowDepth, value: 3))
            case "(" where chr == ")":
                calculateBracket(with: Bracket(depth: nowDepth, value: 2))
            default:
                terminate()
            }
            _ = stack.popLast()!
            nowDepth -= 1
        } else {
            terminate()
        }
    }
}

/// 괄호값 스택의 마지막 아이템의 depth가 새로 추가할 괄호의 depth보다 작아질 때까지 아래 과정을 반복하여 새로 추가할 Bracket값을 갱신
/// - last의 depth가 더 크다면 : value끼리 곱하고, 새로 추가할 Bracket의 depth를 반영
/// - last의 depth가 같다면 : value끼리 더하고, 새로 추가할 Bracket의 depth를 반영
/// - 괄호값 스택이 비거나 마지막 아이템의 depth가 작아지면 : bracketToAdd를 추가
func calculateBracket(with newBracket: Bracket) {
    var bracketToAdd: Bracket = newBracket
    guard !brackets.isEmpty else {
        brackets.append(bracketToAdd)
        return
    }
    while !brackets.isEmpty && brackets.last!.depth >= bracketToAdd.depth {
        let last = brackets.popLast()!
        if last.depth > bracketToAdd.depth {
            bracketToAdd = Bracket(
                depth: bracketToAdd.depth,
                value: last.value * bracketToAdd.value
            )
        } else if last.depth == bracketToAdd.depth {
            bracketToAdd = Bracket(
                depth: bracketToAdd.depth,
                value: last.value + bracketToAdd.value
            )
        }
    }
    brackets.append(bracketToAdd)
}

if brackets.count == 1 {
    print(brackets.last!.value)
} else {
    terminate()
}