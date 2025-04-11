import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var dict = [String: [String]]()
    for cloth in clothes {
        let (name, type) = (cloth[0], cloth[1])
        dict[type, default: []].append(name)
    }
    
    // 각 종류 별 의상 개수를 곱하면 모든 조합 (착용하지 않는 경우 1개 추가)
    var answer = dict.values.reduce(1) { $0 * ($1.count + 1) } - 1 // 아무것도 착용하지 않는 경우 하나 제거
    
    return answer
}