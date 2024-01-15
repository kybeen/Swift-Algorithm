import Foundation

let nums = readLine()!.split(separator: " ").map{ Int($0)! }
let n = nums[0]
let m = nums[1]
var arr = readLine()!.split(separator: " ").map{ Int($0)! }
arr.sort()

var result = ""
var stack = [String]()

func dfs(_ depth: Int) {
    if depth == m {
        result += stack.joined(separator: " ") + "\n"
        return
    }
    
    for i in 0..<n {
        // 비내림차순이면 탐색
        if Int(stack.last!)! <= arr[i] {
            stack.append(String(arr[i]))
            dfs(depth+1)
            _ = stack.popLast()
        }
    }
}

for i in 0..<n {
    stack.append(String(arr[i]))
    dfs(1)
    _ = stack.popLast()
}

print(result)