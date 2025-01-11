import Foundation

func solution(_ s:String) -> [Int] {
    var s = s.map { String($0) }
    var binaryTransCount = 0
    var removedZeroCount = 0
    
    while s != ["1"] {
        let totalCount = s.count
        let zeroCount = s.filter { $0 == "0" }.count
        let c = totalCount - zeroCount
        binaryTransCount += 1
        removedZeroCount += zeroCount
        
        s = String(c, radix: 2).map { String($0) }
    }
    
    return [binaryTransCount, removedZeroCount]
}