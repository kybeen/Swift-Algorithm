import Foundation

let nums = readLine()!.split(separator: " ").map{ Int($0)! }
let n = nums[0]
let m = nums[1]

var arr = [Int]()
var answer = [String]()

func dfs(_ depth: Int) {
    if depth == m {
        answer.append(arr.map{ String($0) }.joined(separator: " "))
        return
    }
    
    for i in 1...n {
        if arr.last! <= i {
            arr.append(i)
            dfs(depth+1)
            arr.popLast()
        }
    }
}

for i in 1...n {
    arr.append(i)
    dfs(1)
    arr.popLast()
}

print(answer.joined(separator: "\n"))