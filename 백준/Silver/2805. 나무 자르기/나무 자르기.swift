import Foundation

let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0]
let M = NM[1]
let trees = readLine()!.split(separator: " ").map { Int($0)! }

var start = 1
var end = trees.max()!
var result = 0

while start <= end {
    let mid = (start + end) / 2 // 절단기의 높이
    
    var totalLen = 0
    for tree in trees {
        // 나무의 높이가 절단기 높이보다 높으면 잘린 길이 더하기
        if tree > mid {
            totalLen += (tree - mid)
        }
    }
    
    // M미터 이상의 나무를 자를 수 있으면
    if totalLen >= M {
        result = max(result, mid)
        start = mid + 1
    } else { // M미터 이상의 나무를 자를 수 없으면
        end = mid - 1
    }
}

print(result)