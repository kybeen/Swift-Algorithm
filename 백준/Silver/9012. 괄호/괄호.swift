import Foundation

let num = Int(readLine()!)!
for _ in 0..<num {
    let inputValue = readLine()!
    var stack = [Int]()
    var isChecked: Bool = false
    for chr in inputValue {
        if chr == "(" {
            stack.append(0)
        } else {
            if !stack.isEmpty {
                stack.removeLast()
            } else {
                isChecked = true
                break
            }
        }
    }
    
    if !isChecked {
        if stack.isEmpty {
            print("YES")
        } else {
            print("NO")
        }
    } else {
        print("NO")
    }
    
}