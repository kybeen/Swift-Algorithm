import Foundation

let nums = readLine()!.split(separator: " ").map{ Int($0)! }
let n = nums[0]
let m = nums[1]

var arr = [Int]()

func dfs() {
    // 길이가 m이 되면 출력 후 리턴
    if arr.count == m {
        print(arr.map{ String($0) }.joined(separator: " "))
        return
    }
    
    // 배열의 마지막 값보다 클 경우에 DFS 진행
    for i in 1...n {
        if arr.last! < i {
            arr.append(i)
            dfs()
            arr.popLast()
        }
    }
}

for i in 1...n {
    arr = [Int]()
    arr.append(i)
    dfs()
}