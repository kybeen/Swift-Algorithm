import Foundation

func solution(_ cards1:[String], _ cards2:[String], _ goal:[String]) -> String {
    var rCards1 = Array(cards1.reversed())
    var rCards2 = Array(cards2.reversed())
    var rGoal = Array(goal.reversed())
    
    while let last = rGoal.last {
        if let lastOfCards1 = rCards1.last, last == lastOfCards1 {
            _ = rCards1.popLast()
            _ = rGoal.popLast()
            continue
        } else if let lastOfCards2 = rCards2.last, last == lastOfCards2 {
            _ = rCards2.popLast()
            _ = rGoal.popLast()
            continue
        } else {
            return "No"
        }
    }
    
    return "Yes"
}