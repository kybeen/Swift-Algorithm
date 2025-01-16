import Foundation

func solution(_ d:[Int], _ budget:Int) -> Int {
    var budget = budget
    var result = 0
    
    for cost in d.sorted(by: <) {
        budget -= cost
        if budget < 0 {
            break
        }
        result += 1
    }
    
    return result
}