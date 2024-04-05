import Foundation

let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0]
let M = NM[1]
var trees = readLine()!.split(separator: " ").map { Int($0)! }

// 나무 자르기
func cutTrees(height: Int) -> Int {
    var result = 0
    for tree in trees {
        if (tree - height) > 0 {
            result += (tree - height)
        }
    }
    return result
}

func binarySearch() -> Int {
    var start = 0
    var end = trees.max()! + 1
    
    while start + 1 < end {
        let mid = (start + end) / 2
        if cutTrees(height: mid) >= M {
            start = mid
        } else {
            end = mid
        }
    }
    
    return start
}

print(binarySearch())