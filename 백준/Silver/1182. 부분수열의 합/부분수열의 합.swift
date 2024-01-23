import Foundation

let NS = readLine()!.split(separator: " ").map { Int($0)! }
let N = NS[0]
let S = NS[1]
var nums = readLine()!.split(separator: " ").map { Int($0)! }

var result = 0

func dfs(_ now: Int, _ sum: Int) {
    if sum == S {
        result += 1
    }
    
    for i in now+1..<N {
        dfs(i, sum+nums[i])
    }
}

for i in 0..<N {
    dfs(i, nums[i])
}
print(result)