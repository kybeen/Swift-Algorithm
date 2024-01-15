import Foundation

while true {
    let testCase = readLine()!.split(separator: " ").map{ Int($0)! }
    let k = testCase[0]
    if k == 0 { break }
    
    var stack = [Int]()
    func dfs(_ depth: Int, _ now: Int) {
        if depth == 6 {
            print(stack.map{String($0)}.joined(separator: " "))
            return
        }
        
        if now < k {
            for i in now+1...k {
                stack.append(testCase[i])
                dfs(depth+1, i)
                stack.popLast()
            }
        }
    }
    
    dfs(0, 0)
    print()
}