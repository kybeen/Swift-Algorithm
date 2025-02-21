import Foundation

func solution(_ numbers:[Int]) -> String {
    var sortedNumbers = numbers.sorted { "\($0)\($1)" >= "\($1)\($0)" }
    while let first = sortedNumbers.first, first == 0, sortedNumbers.count > 1 {
        _ = sortedNumbers.removeFirst()
    }
    return sortedNumbers.map { String($0) }.joined()
}