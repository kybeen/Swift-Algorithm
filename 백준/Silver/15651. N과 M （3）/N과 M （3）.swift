import Foundation

let nums = readLine()!.split(separator: " ").map{ Int($0)! }
let n = nums[0]
let m = nums[1]

var arr = [Int]()
var answer = [String]()
func dfs(_ depth: Int) {
    if depth == m {
//        print(arr.map{ String($0) }.joined(separator: " ")) // print를 매번 해주면 시간이 오래걸림
        answer.append(arr.map{ String($0) }.joined(separator: " "))
        return
    }
    
    for i in 1...n {
        arr.append(i)
        dfs(depth+1)
        arr.popLast()
    }
}

dfs(0)
print(answer.joined(separator: "\n"))