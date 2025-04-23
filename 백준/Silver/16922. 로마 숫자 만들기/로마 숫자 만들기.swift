import Foundation

let N = Int(readLine()!)!
let roman = [1, 5, 10, 50]
var answer = Set<Int>()

func dfs(_ start: Int, _ num: Int, _ depth: Int) {
    if depth == N {
        answer.insert(num)
        return
    }
    
    for i in start..<4 {
        dfs(i, num+roman[i], depth+1)
    }
}
dfs(0, 0, 0)
print(answer.count)