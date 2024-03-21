import Foundation

func solution(_ friends:[String], _ gifts:[String]) -> Int {
    // give: 준 선물, take: 받은 선물, zisoo: 선물 지수
    typealias GiftValue = (give: Int, take: Int, zisoo: Int)
    // 각 사람의 딕셔너리 생성
    var dict = [String : GiftValue]()
    for friend in friends {
        dict[friend] = (0, 0, 0)
    }
    // 선물을 주고받은 테이블 생성
    var table = Array(repeating: Array(repeating: 0, count: friends.count), count: friends.count)
    
    for gift in gifts {
        let ab = gift.split(separator: " ").map { String($0) }
        let a = ab[0]
        let b = ab[1]
        // 딕셔너리 업데이트
        dict[a]!.give += 1
        dict[a]!.zisoo += 1
        dict[b]!.take += 1
        dict[b]!.zisoo -= 1
        // 테이블 업데이트
        let aIdx = friends.firstIndex(of: a)!
        let bIdx = friends.firstIndex(of: b)!
        table[aIdx][bIdx] += 1
    }
    
    var result = [Int](repeating: 0, count: friends.count) // 다음달에 각 사람이 받게 될 선물 개수
    for i in 0..<friends.count {
        for j in 0..<friends.count {
            // 모든 친구에 대해서 확인할 것이기 때문에 현재 사람이 준 경우만 확인
            // 자기 자신은 x
            if i != j {
                // 준 선물이 더 많다면 다음달에 선물을 받음
                if table[i][j] > table[j][i] {
                    result[i] += 1
                } else if table[i][j] == table[j][i] { // 서로 주고받은 선물이 없거나 같으면
                    // 선물 지수 확인
                    if dict[friends[i]]!.zisoo > dict[friends[j]]!.zisoo {
                        result[i] += 1
                    }
                }
            }
        }
    }
    
    return result.max()!
}