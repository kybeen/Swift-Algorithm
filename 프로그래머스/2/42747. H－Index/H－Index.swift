import Foundation

func solution(_ citations:[Int]) -> Int {
    let citations = citations.sorted(by: >) // 역순 정렬
    let n = citations.count
    let maxCnt = citations.first! // 최대 인용 횟수
    var hIdxArr = [Int](repeating: 0, count: maxCnt+1) // dIdxArr[i] : i번 이상 인용된 논문 개수
    
    for citation in citations {
        for i in 0...citation {
            hIdxArr[i] += 1
        }
    }
    
    var H_Index = 0
    for i in 0...maxCnt {
        // i번 이상 인용된 논문이 i편 이상이면 H-Index 갱신
        if hIdxArr[i] >= i {
            H_Index = max(H_Index, i)
        }
    }
    
    return H_Index
}