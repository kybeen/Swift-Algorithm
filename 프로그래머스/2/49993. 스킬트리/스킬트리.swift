import Foundation

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    let skill = skill.map({ String($0) })
    let skillTrees = skill_trees.map { row in
        row.map({ String($0) })
    }
    
    var order = [String: Int]() // 스킬을 배워야 하는 순서
    for (idx, value) in skill.enumerated() {
        order[value] = idx
    }
    // print(order)
    
    var result = [Bool]()
    for skillTree in skillTrees {
        var isPossible = true
        var requiredOrder = 0 // 현재 배워야 하는 스킬 번호
        for sk in skillTree {
            if order[sk] != nil {
                // 배워야 하는 스킬 번호 갱신
                if order[sk]! == requiredOrder {
                    requiredOrder = order[sk]! + 1
                } else {
                    // 아직 배울 수 없는 스킬임
                    isPossible = false
                    break
                }
            }
        }
        result.append(isPossible)
    }
    
    return result.filter({ $0 }).count
}