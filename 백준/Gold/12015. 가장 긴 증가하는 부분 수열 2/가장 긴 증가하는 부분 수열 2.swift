import Foundation

let N = Int(readLine()!)!
let A = readLine()!.split(separator: " ").map { Int($0)! }

var lis = [Int]()
// 새로운 값이 들어갈 위치 찾기 (이분탐색)
func binarySearch(target: Int) -> Int {
    var start = 0
    var end = lis.count - 1
    
    while start < end {
        let mid = (start + end) / 2
        
        if lis[mid] < target {
            start = mid + 1
        } else {
            end = mid
        }
    }
    
    return end
}

lis.append(A[0])
for i in 1..<N {
    // 현재 수가 lis 배열의 마지막 값보다 크면 마지막에 추가
    if A[i] > lis.last! {
        lis.append(A[i])
    } else { // 현재 수가 lis 배열의 처음~중간 위치에 들어가야 한다면 이분탐색으로 위치를 찾아줌
        let idx = binarySearch(target: A[i])
        lis[idx] = A[i]
    }
}

print(lis.count)