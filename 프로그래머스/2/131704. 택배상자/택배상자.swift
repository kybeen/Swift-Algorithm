import Foundation

func solution(_ order:[Int]) -> Int {
    var subBelt = [Int]()
    var mainBelt = Array(Array(1...order.count).reversed()) // 연산 효율을 위해 뒤집음
    var answer = 0
    
    var nowBoxIdx = 0
    while nowBoxIdx < order.count {
        let nowBox = order[nowBoxIdx]
        
        if let mainLast = mainBelt.last, mainLast == nowBox { // 메인 벨트의 맨 앞에 원하는 택배가 있는 경우
            _ = mainBelt.popLast()
            answer += 1
            nowBoxIdx += 1
        } else if let subLast = subBelt.last, subLast == nowBox { // 서브 벨트의 맨 앞에 원하는 택배가 있는 경우
            _ = subBelt.popLast()
            answer += 1
            nowBoxIdx += 1
        } else { // 메인/서브 벨트에 모두 원하는 택배가 없는 경우
            if mainBelt.isEmpty { // 메인 벨트가 비어 있다면 종료
                return answer
            } else { // 그렇지 않다면 메인 벨트의 현재 상자를 서브 벨트로 옮김
               subBelt.append(mainBelt.popLast()!) 
            }
        }
    }
    
    return answer
}