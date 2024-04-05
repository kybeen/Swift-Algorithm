import Foundation

let KN = readLine()!.split(separator: " ").map { Int($0)! }
let K = KN[0]
let N = KN[1]
var lans = [Int]()
for _ in 0..<K {
    lans.append(Int(readLine()!)!)
}

// 만들 수 있는 랜선 개수 구하기
func makeLans(length: Int) -> Int {
    var result = 0
    for lan in lans {
        result += (lan / length)
    }
    return result
}

func binarySearch() {
    var start = 0
    var end = lans.max()! + 1
    
    while start + 1 < end {
        let mid = (start + end) / 2
        if makeLans(length: mid) >= N {
            start = mid
        } else {
            end = mid
        }
    }
    
    print(start)
}

binarySearch()