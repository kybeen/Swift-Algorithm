import Foundation

func solution(_ s:String) -> Int{
    var str = s.map { String($0) }
    var stk = [String]()

    for letter in str {
        if let last = stk.last, last == letter {
            _ = stk.popLast()!
        } else {
            stk.append(letter)
        }
    }

    return stk.isEmpty ? 1 : 0
}