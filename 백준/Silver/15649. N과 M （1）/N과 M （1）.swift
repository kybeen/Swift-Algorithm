import Foundation

let nums = readLine()!.split(separator: " ").map{ Int($0)! }
let n = nums[0]
let m = nums[1]

var arr = [Int]()

func dfs() {
    // 배열 arr의 길이가 m일 때 출력하고 리턴
    if arr.count == m {
        print(arr.map{ String($0) }.joined(separator: " "))
        return
    }
    
    for i in 1...n {
        // 중복되는 수가 아닐 때만 DFS 진행
        if !arr.contains(i) {
            arr.append(i)
            dfs()
            arr.popLast()
        }
    }
}

dfs()