import Foundation

let nums = readLine()!.split(separator: " ").map { Int($0)! }
let N = nums[0]
let M = nums[1]
var arr = readLine()!.split(separator: " ").map { Int($0)! }
arr.sort()

var result = ""

func dfs(_ depth: Int, _ nowArr: String) {
    if depth == M {
        result += nowArr + "\n"
        return
    }
    
    var recent = 0 // 현재 depth에서 마지막으로 확인한 숫자 (한 depth에서는 같은 수를 확인하면 중복이기 때문에 확인할 필요 x)
    for i in 0..<N {
        if recent != arr[i] {
            recent = arr[i]
            dfs(depth+1, nowArr + "\(arr[i]) ")
        }
    }
}

dfs(0, "")
print(result)