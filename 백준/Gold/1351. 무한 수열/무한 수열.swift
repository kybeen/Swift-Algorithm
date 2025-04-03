import Foundation

let NPQ = readLine()!.split(separator: " ").map({ Int($0)! })
let (N, P, Q) = (NPQ[0], NPQ[1], NPQ[2])
var A = [Int: Int]()
A[0] = 1

func dfs(_ i: Int) -> Int {
    // 구해진 답이 있다면 활용
    if let calculatedA = A[i] {
        return calculatedA
    }
    
    A[i] = dfs(i / P) + dfs(i / Q)
    return A[i, default: 0]
}

print(dfs(N))