import Foundation

func solution(_ s:String) -> [Int] {
    var s = s
    _ = s.removeFirst()
    _ = s.removeLast()
    _ = s.removeFirst()
    _ = s.removeLast()
    let numbers = s.components(separatedBy: "},{")
    .joined(separator: ",")
    .components(separatedBy: ",")
    .map { Int($0)! }
    
    var dict = [Int: Int]() // [숫자: 등장 횟수]
    for num in numbers {
        dict[num, default: 1] += 1
    }
    
    return dict.sorted { $0.value > $1.value }.map(\.key)
}