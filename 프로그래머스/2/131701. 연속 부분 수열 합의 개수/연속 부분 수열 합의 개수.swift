import Foundation

func solution(_ elements:[Int]) -> Int {
    let N = elements.count
    
    var resultSums = Set<Int>()
    
    for i in 0..<N {
        var sum = 0
        for j in 0..<N {
            sum += elements[(i+j) % N]
            resultSums.insert(sum)
        }
    }
    
    return resultSums.count
}