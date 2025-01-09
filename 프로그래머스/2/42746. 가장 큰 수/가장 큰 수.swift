import Foundation

func solution(_ numbers:[Int]) -> String {
    let sortedNumbers = numbers.sorted {
        return Int("\($0)\($1)")! > Int("\($1)\($0)")!
    }
    let result = sortedNumbers.map({ String($0) }).joined(separator: "")
    return sortedNumbers[0] == 0 ? "0" : result
}