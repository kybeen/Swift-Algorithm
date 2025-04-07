import Foundation

func solution(_ expression:String) -> Int64 {
    let priority: [[String]] = [
        ["+", "-", "*"],
        ["+", "*", "-"],
        ["-", "+", "*"],
        ["-", "*", "+"],
        ["*", "+", "-"],
        ["*", "-", "+"]
    ]
    
    let nums = expression.components(separatedBy: ["+", "-", "*"]).map({ Int64($0)! })
    let operands = expression.filter({ ["+", "-", "*"].contains($0) }).map({ String($0) })
    
    func calculate(_ nums: [Int64], _ operands: [String], _ priority: [String]) -> Int64 {
        var nums = nums
        var operands = operands
        
        for nowOP in priority {
            var i = 0
            while i < operands.count {
                let operand = operands[i]
                if operand == nowOP {
                    let lhs = nums[i]
                    let rhs = nums[i+1]
                    
                    switch operand {
                    case "*":
                        nums[i] = lhs * rhs
                    case "+":
                        nums[i] = lhs + rhs
                    case "-":
                        nums[i] = lhs - rhs
                    default:
                        break
                    }
                    
                    nums.remove(at: i+1)
                    operands.remove(at: i)
                } else {
                    i += 1
                }
            }
        }
        
        return nums.first!
    }
        
    var answer: Int64 = 0
    for pro in priority {
        let result = abs(calculate(nums, operands, pro))
        answer = max(answer, result)
    }
    
    return answer
}