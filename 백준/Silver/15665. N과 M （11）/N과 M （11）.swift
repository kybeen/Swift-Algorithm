import Foundation

let nums = readLine()!.split(separator: " ").map { Int($0)! }
let N = nums[0]
let M = nums[1]
var arr = readLine()!.split(separator: " ").map { Int($0)! }
arr.sort()

var stack = [String]()
var result = ""
var set = Set<String>()

func dfs(_ depth: Int) {
    if depth == M {
        let temp = stack.joined(separator: " ")
        if !set.contains(temp) {
            set.insert(temp)
            result += temp + "\n"
        }
        return
    }
    
    for i in 0..<N {
        stack.append(String(arr[i]))
        dfs(depth+1)
        _ = stack.popLast()
    }
}

dfs(0)
print(result)