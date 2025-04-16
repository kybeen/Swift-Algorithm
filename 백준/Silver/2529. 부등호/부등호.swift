import Foundation

let k = Int(readLine()!)!
let inequality = readLine()!.split(separator: " ")

var answer = (minValue: Int.max, maxValue: Int.min, minStr: "", maxStr: "")
var stk = [Int]()

func dfs() {
    if stk.count == k+1 {
        let result = stk.map({ String($0) }).joined(separator: "")
        if answer.minValue > Int(result)! {
            answer.minValue = Int(result)!
            answer.minStr = result
        }
        if answer.maxValue < Int(result)! {
            answer.maxValue = Int(result)!
            answer.maxStr = result
        }
        return
    }
    
    for num in 0...9 {
        if !stk.contains(num) {
            if stk.isEmpty {
                stk.append(num)
                dfs()
                _ = stk.popLast()
            } else {
                let lastIdx = stk.count-1
                switch inequality[lastIdx] {
                case "<":
                    if stk[lastIdx] < num {
                        stk.append(num)
                        dfs()
                        _ = stk.popLast()
                    }
                case ">":
                    if stk[lastIdx] > num {
                        stk.append(num)
                        dfs()
                        _ = stk.popLast()
                    }
                default: break
                }
            }
        }
    }
}

dfs()

print(answer.maxStr)
print(answer.minStr)