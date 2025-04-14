import Foundation

let NS = readLine()!.split(separator: " ").map({ Int($0)! })
let (N, S) = (NS[0], NS[1])
let nums = readLine()!.split(separator: " ").map({ Int($0)! })

var answer = 0

func dfs(_ now: Int, _ sum: Int) {
    if sum == S {
        answer += 1
    }
    
    for i in now+1..<N {
        dfs(i, sum+nums[i])
    }
}

for i in 0..<N {
    dfs(i, nums[i])
}
print(answer)
