import Foundation

/// 2개 문자열의 패턴 일치 여부를 확인
/// - 각 자리에 해당하는 문자가 다르고, * 문자가 아니라면 false 반환
func isPatternMatching(_ strA: String, _ strB: String) -> Bool {
    guard strA.count == strB.count else { return false }
    
    let strA = strA.map { String($0) }
    let strB = strB.map { String($0) }
    let strLen = strA.count
    
    var isMatching = true
    for i in 0..<strLen {
        let (a, b) = (strA[i], strB[i])
        if (a != b) && !(a == "*" || b == "*") {
            isMatching = false
            break
        }
    }
    return isMatching
}

func solution(_ user_id:[String], _ banned_id:[String]) -> Int {
    let userID = user_id
    let bannedID = banned_id
    var mappedID = [[String]]() // mappedID[i] : bannedID[i]에 맵핑된 유저 닉네임들
    
    // bannedID와 패턴이 일치하는 유저 ID 맵핑
    for banned in bannedID {
        let mappedUsers = userID.filter({ isPatternMatching(banned, $0) })
        mappedID.append(mappedUsers)
    }
    
    // mappedID.forEach { print($0) }
    
    var result = Set<[String]>()
    
    var stk = [String]()
    func dfs(_ nowBannedIdx: Int, _ depth: Int) {
        if depth == bannedID.count {
            result.insert(stk.sorted())
            return
        }
        
        for mappedUser in mappedID[nowBannedIdx] {
            if !stk.contains(mappedUser) {
                stk.append(mappedUser)
                dfs(nowBannedIdx+1, depth+1)
                _ = stk.popLast()
            }
        }
    }
    dfs(0, 0)
    
    // print()
    // result.forEach { print($0) }
    
    return result.count
}