import Foundation

func solution(_ citations:[Int]) -> Int {
    let sortedCitations = citations.sorted(by: >)
    let maxCount = sortedCitations.first!
    var hIndexArr = [Int](repeating: 0, count: maxCount + 1)
    var hIndex = 0
    
    for citation in sortedCitations {
        for idx in 0...citation {
            hIndexArr[idx] += 1
        }
    }
    
    for h in 0...maxCount {
        if hIndexArr[h] >= h {
            hIndex = max(hIndex, h)
        }
    }
    
    return hIndex
}