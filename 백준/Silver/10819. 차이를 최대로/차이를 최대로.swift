import Foundation

let n = Int(readLine()!)!
let inputArr = readLine()!.split(separator: " ").map{ Int($0)! }

var arr = [Int]()
var idx = [Int]() // 현재 arr에 들어 있는 수의 인덱스
var result = 0
func dfs(_ depth: Int) {
    // 순열이 생기면 주어진 식의 최대값을 구하고 큰 값으로 정답을 갱신해준다.
    if depth == n {
        var temp = 0
        for k in 0..<n-1 {
            temp += abs(arr[k] - arr[k+1])
        }
        result = max(result, temp)
        return
    }
    
    for i in 0..<n {
        // 배열에 같은 숫자가 들어 있을 수도 있기 때문에 인덱스로 확인
        if !idx.contains(i) {
            arr.append(inputArr[i])
            idx.append(i)
            dfs(depth+1)
            arr.popLast()
            idx.popLast()
        }
    }
}

dfs(0)
print(result)