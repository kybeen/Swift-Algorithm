import Foundation

let nums = readLine()!.split(separator: " ").map { Int($0)! }
let L = nums[0]
let C = nums[1]
var arr = readLine()!.split(separator: " ").map { String($0) }
arr.sort()

var stack = [String]()
var result = ""

func dfs(_ depth: Int, _ lastIndex: Int) {
    if depth == L {
        let moCount = stack.filter { ["a", "i", "o", "u", "e"].contains($0) }.count // 모음 개수
        let jaCount = L - moCount // 자음 개수
        if moCount >= 1 && jaCount >= 2 {
            result += stack.joined(separator: "") + "\n"
        }
        return
    }
    
    for i in lastIndex+1..<C {
        stack.append(arr[i])
        dfs(depth+1, i)
        _ = stack.popLast()
    }
}

for i in 0..<C {
    stack.append(arr[i])
    dfs(1, i)
    _ = stack.popLast()
}

print(result)