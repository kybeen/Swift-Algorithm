import Foundation

let n = Int(readLine()!)!
var permutation = readLine()!.split(separator: " ").map{ Int($0)! }

if permutation == [Int](1...n).reversed() { // 마지막 순열일 경우
    print(-1)
} else {
    var aIdx = 0 // 순열[i] < 순열[i+1] 조건을 만족하는 가장 큰 i의 인덱스
    var bIdx = 0 // aIdx 뒤의 인덱스 중 순열[aIdx]보다 큰 값을 갖는 가장 뒤에 있는 인덱스

    for i in 0..<n {
        if i < n-1, permutation[i] < permutation[i+1] {
            aIdx = i
        }
    }

    for j in aIdx+1..<n {
        if permutation[aIdx] < permutation[j] {
            bIdx = j
        }
    }

    permutation.swapAt(aIdx, bIdx)
    permutation = permutation[...aIdx] + permutation[(aIdx+1)...].sorted()
    print(permutation.map{String($0)}.joined(separator: " "))
}