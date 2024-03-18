import Foundation

func solution(_ numbers:[Int]) -> String {
    let temp = numbers.sorted { Int("\($0)\($1)")! > Int("\($1)\($0)")! }
    if temp[0] == 0 {
        return "0"
    } else {
        return temp.reduce("") { $0 + String($1) }
    }
}