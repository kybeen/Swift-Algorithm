import Foundation

func solution(_ s:String) -> [Int] {
    var s = s.map { String($0) }
    var result = [0, 0] // 이진 변환 횟수, 제거된 0 개수
    
    while true {
        if s == ["1"] {
            break
        }
        
        let totalCount = s.count
        let zeroCount = s.filter { $0 == "0" }.count
        let c = totalCount - zeroCount
        result[0] += 1
        result[1] += zeroCount
        
        s = String(c, radix: 2).map { String($0) }
    }
    
    return result
}