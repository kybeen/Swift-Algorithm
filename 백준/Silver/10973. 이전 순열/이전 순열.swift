import Foundation

let n = Int(readLine()!)!
var permutation = readLine()!.split(separator: " ").map{ Int($0)! }

if permutation == [Int](1...n) {
    print(-1)
} else {
    var aIdx = 0
    
    for i in 0..<n {
        if i < n-1, permutation[i] > permutation[i+1] {
            aIdx = i
        }
    }
    
    permutation = permutation[...aIdx] + permutation[(aIdx+1)...].sorted(by: >)
    for j in aIdx..<n {
        if permutation[aIdx] > permutation[j] {
            permutation.swapAt(aIdx, j)
            break
        }
    }
    print(permutation.map{String($0)}.joined(separator: " "))
}