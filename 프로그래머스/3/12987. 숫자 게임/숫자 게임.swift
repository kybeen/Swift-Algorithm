import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    var a = a.sorted()
    var b = b.sorted()
    
    var aIdx = 0
    var bIdx = 0
    var answer = 0
    
    while aIdx < a.count && bIdx < b.count {
        if b[bIdx] > a[aIdx] {
            answer += 1
            aIdx += 1
            bIdx += 1
        } else {
            bIdx += 1
        }
    }
    
    return answer
}