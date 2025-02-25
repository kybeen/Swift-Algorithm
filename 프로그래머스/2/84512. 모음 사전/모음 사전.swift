import Foundation

func solution(_ word:String) -> Int {
    let word = word.map { String($0) }
    let moeum = ["A", "E", "I", "O", "U"]
    var stk = [String]()
    var answer = 0
    var order = 0
    
    func dfs(_ now: Int) {
        if stk == word {
            answer = order
        }
        if stk.count == 5 {
            return
        }
        
        for i in 0..<5 {
            stk.append(moeum[i])
            order += 1
            dfs(i)
            _ = stk.popLast()
        }
    }
    
    dfs(0)
    
    return answer
}