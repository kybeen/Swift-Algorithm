import Foundation

let nums = readLine()!.split(separator: " ").map{ Int($0)! }
let n = nums[0]
let m = nums[1]
var arr = readLine()!.split(separator: " ").map{ Int($0)! }
arr.sort()

var result = ""
//var stack = [Int]()
var stack = [String]()

func dfs(_ depth: Int) {
    if depth == m {
//        result += stack.map{String($0)}.joined(separator: " ") + "\n"
        result += stack.joined(separator: " ") + "\n"
        return
    }
    
    for i in 0..<n {
//        stack.append(arr[i])
        stack.append(String(arr[i]))
        dfs(depth+1)
        stack.popLast()
    }
}

dfs(0)
print(result)