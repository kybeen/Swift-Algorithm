import Foundation

func solution(_ A:[Int], _ B:[Int]) -> Int {
    let length = A.count
    var ans = 0

    let A = A.sorted()
    let B = B.sorted(by: { $0 > $1 })
    for i in 0..<length {
        ans += (A[i] * B[i])
    }

    return ans
}