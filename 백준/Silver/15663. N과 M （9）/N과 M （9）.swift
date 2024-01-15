import Foundation

let nums = readLine()!.split(separator: " ").map{ Int($0)! }
let n = nums[0]
let m = nums[1]
var arr = readLine()!.split(separator: " ").map{ Int($0)! }
arr.sort()

var result = [String]()
var stack = [Int]()
var visited = [Bool](repeating: false, count: n)
var set = Set<String>()

func dfs(_ depth: Int) {
    if depth == m {
        let nowArr = stack.map{ String($0) }.joined(separator: " ")
        if !set.contains(nowArr) {
            result.append(nowArr)
            set.insert(nowArr)
        }
        return
    }
    
    for i in 0..<n {
        if visited[i] == false {
            stack.append(arr[i])
            visited[i] = true
            dfs(depth+1)
            _ = stack.popLast()
            visited[i] = false
        }
    }
}

dfs(0)

print(result.joined(separator: "\n"))