import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var dict = [String: [String]]()
    for cloth in clothes {
        if dict[cloth[1]] != nil {
            dict[cloth[1]]!.append(cloth[0])
        } else {
            dict[cloth[1]] = [cloth[0]]
        }
    }
    
    var result = 1
    var categories = dict.keys
    // 각 의상 종류 별 옷의 개수들을 입지 않는 경우까지(+1) 고려해서 곱해주면 모든 경우의 수가 나옴
    for category in categories {
        result *= (dict[category]!.count + 1)
    }
    
    // 옷을 하나도 입지 않는 경우를 하나 빼주면 정답
    return result - 1
}