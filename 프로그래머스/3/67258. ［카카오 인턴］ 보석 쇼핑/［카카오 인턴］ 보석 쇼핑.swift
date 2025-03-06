import Foundation

func solution(_ gems:[String]) -> [Int] {
    let gemsCount = gems.count
    // 보석 종류
    let gemKinds = Array(Set<String>(gems))
    let gemKindsCount = gemKinds.count
    if gemKindsCount == 1 {
        return [1, 1]
    }
    
    var gemDict = [String: Int]() // 보석 개수 딕셔너리
    
    var shortest = Int.max
    var answer = (0, 0)
    var left = 0
    var right = 0
    gemDict[gems[0]] = 1
    
    while right < gemsCount && left <= right {
        let gemKeyCount = gemDict.keys.count
        
        if gemKeyCount >= gemKindsCount {
            // 최소 거리 갱신
            let dist = right - left
            if shortest > dist {
                shortest = dist
                answer = (left+1, right+1)
            }
            gemDict[gems[left], default: 0] -= 1
            if gemDict[gems[left]] == 0 {
                gemDict[gems[left]] = nil
            }
            left += 1
        } else {
            right += 1
            if right < gemsCount {
                gemDict[gems[right], default: 0] += 1
            }
        }
    }
    
    return [answer.0, answer.1]
}