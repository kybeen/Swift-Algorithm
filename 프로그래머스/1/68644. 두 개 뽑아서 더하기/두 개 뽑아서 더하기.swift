import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var totalSums = Set<Int>()
    for i in 0..<numbers.count-1 {
        for j in i+1..<numbers.count {
            let sum = numbers[i] + numbers[j]
            totalSums.insert(sum)
        }
    }
    return totalSums.sorted(by: <)
}