import Foundation

let input = readLine()!.split(separator: " ").map{ Int($0)! }
let n = input[0]
let m = input[1]
var nums = readLine()!.split(separator: " ").map{ Int($0)! }

nums.sort()

var arr = [Int]()
var result = [String]()
func dfs(_ depth: Int) {
    if depth == m {
        result.append(arr.map{ String($0) }.joined(separator: " "))
        return
    }
    
    for i in 0..<n {
        if arr.last! < nums[i] {
            arr.append(nums[i])
            dfs(depth+1)
            arr.popLast()
        }
    }
}

for i in 0..<n {
    arr.append(nums[i])
    dfs(1)
    arr.popLast()
}

print(result.joined(separator: "\n"))