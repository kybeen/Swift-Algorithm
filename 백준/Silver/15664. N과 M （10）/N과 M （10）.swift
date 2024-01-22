import Foundation

let nums = readLine()!.split(separator: " ").map { Int($0)! }
let N = nums[0]
let M = nums[1]
var arr = readLine()!.split(separator: " ").map { Int($0)! }
arr.sort()

var stack = [Int]()
var result = [String]()
var set = Set<String>() // 중복되는 수열이 있는지 확인하기 위한 Set

func dfs(_ depth: Int, _ now: Int) {
    if depth == M {
        let temp = stack.map{String($0)}.joined(separator: " ")
        if !set.contains(temp) {
            set.insert(temp)
            result.append(temp)
        }
        return
    }
    
    for i in now+1..<N {
        stack.append(arr[i])
        dfs(depth+1, i)
        _ = stack.popLast()
    }
}

dfs(0, -1)
print(result.joined(separator: "\n"))