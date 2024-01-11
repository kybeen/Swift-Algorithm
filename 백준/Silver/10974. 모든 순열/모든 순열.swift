import Foundation

let n = Int(readLine()!)!

var arr = [Int]()
func dfs(_ depth: Int) {
    if depth == n {
        print(arr.map{String($0)}.joined(separator: " "))
        return
    }
    
    for i in 1...n {
        if !arr.contains(i) {
            arr.append(i)
            dfs(depth+1)
            arr.popLast()
        }
    }
}

dfs(0)