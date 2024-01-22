import Foundation

let nums = readLine()!.split(separator: " ").map { Int($0)! }
let N = nums[0]
let M = nums[1]
var arr = readLine()!.split(separator: " ").map { Int($0)! }
arr.sort()

var result = ""

func dfs(_ depth: Int, _ nowIdx: Int, _ nowArr: String) {
    if depth == M {
        result += nowArr + "\n"
        return
    }
    
    var last = 0
    for i in nowIdx..<N {
        if last != arr[i] {
            last = arr[i]
            dfs(depth+1, i, nowArr + "\(arr[i]) ")
        }
    }
}

dfs(0, 0, "")
print(result)