import Foundation

let N = Int(readLine()!)!
var result = 0
testcase: for _ in 0..<N {
    let word = Array(readLine()!)
    var alphabets = Set<Character>()
    
    alphabets.insert(word[0])
    var prev = word[0]
    
    if word.count > 1 {
        for i in 1..<word.count {
            if word[i] != prev { // 이전 알파벳이랑 달라졌을 때
                if !alphabets.contains(word[i]) {
                    alphabets.insert(word[i]) // 집합에 없으면 추가
                    prev = word[i]
                } else {
                    continue testcase // 집합에 있으면 그룹 단어가 아님
                }
            }
        }
    }
    
    result += 1
}

print(result)