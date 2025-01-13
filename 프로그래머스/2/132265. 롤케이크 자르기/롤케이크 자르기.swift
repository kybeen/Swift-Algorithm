import Foundation

func solution(_ topping:[Int]) -> Int {
    let toppingTypesCount = Set<Int>(topping).count
    
    let half = toppingTypesCount / 2
    var cheolSoo = Set<Int>() // 철수는 Set
    var brother = [Int: Int]() // 동생은 딕셔너리
    var brotherCount = toppingTypesCount
    var result = 0
    for t in topping {
        brother[t, default: 0] += 1
    }

    for i in 0..<topping.count {
        cheolSoo.insert(topping[i])
        if brother[topping[i]]! > 0 {
            brother[topping[i]]! -= 1
            if brother[topping[i]]! == 0 { // 동생의 토핑 종류 개수 차감
                brotherCount -= 1
            }
        }
        if cheolSoo.count == brotherCount {
            result += 1
        }
    }

    return result
}