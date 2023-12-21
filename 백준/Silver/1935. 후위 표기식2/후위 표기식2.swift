import Foundation

let n = Int(readLine()!)!
let expression = Array(readLine()!)

let expVar = Array(Set(expression.filter { $0.isLetter })).sorted() // 표현식에서 문자들만 필터링 (중복제거 해줘야함)
var dict = [Character: Double]() // 각 문자에 해당하는 값을 매칭
for i in 0..<n {
    dict[expVar[i]] = Double(readLine()!)!
}

var stk = [Double]()
for chr in expression {
    if !chr.isLetter {
        let b = stk.popLast()!
        let a = stk.popLast()!
        
        switch chr {
        case "+":
            stk.append(a + b)
        case "-":
            stk.append(a - b)
        case "*":
            stk.append(a * b)
        case "/":
            stk.append(a / b)
        default:
            break
        }
    } else {
        stk.append(dict[chr]!)
    }
}

print(String(format: "%.2f", stk.popLast()!))
