import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    var used = Set<String>() // 사용된 단어 집합
    var count = [Int: Int]() // 각 참가자의 차례를 카운트하는 딕셔너리
    
    var prev: String = words[0]
    count[1] = 1
    used.insert(words[0])
    
    for i in 1..<words.count {
        let word = words[i]
        let participant = (i % n) + 1
        count[participant, default: 0] += 1
        
        guard (prev.last! == word.first!) && (!used.contains(word)) else {
            return [participant, count[participant]!]
        }
        
        prev = word
        used.insert(word)
    }
    
    return [0, 0]
}