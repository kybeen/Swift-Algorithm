import Foundation

let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0]
let M = NM[1]
var A = [[Int]]()
var B = [[Int]]()
for _ in 0..<N {
    A.append(Array(readLine()!).map { Int(String($0))! })
}
for _ in 0..<N {
    B.append(Array(readLine()!).map { Int(String($0))! })
}

// 3x3 행렬 뒤집기 (cornerI: 좌상단i좌표, cornerJ: 좌상단j좌표)
func flipSubMatrix(_ cornerI: Int, _ cornerJ: Int) {
    for i in cornerI...cornerI+2 {
        for j in cornerJ...cornerJ+2 {
            if A[i][j] == 1 {
                A[i][j] = 0
            } else {
                A[i][j] = 1
            }
        }
    }
}

var result = 0
// 뒤집을 수 있는 경우
if N >= 3 && M >= 3 {
    for i in 0..<N-2 {
        for j in 0..<M-2 {
            // 현재 위치가 B와 다르다면 그 위치를 왼쪽 위로 하는 3x3 부분행렬을 뒤집어준다.
            if A[i][j] != B[i][j] {
                flipSubMatrix(i, j)
                result += 1
            }
        }
    }
    // 다 뒤집었는데도 A와 B가 다르면 바꿀 수 없는 경우임
    if A != B {
        result = -1
    }
} else {
    // 뒤집을 수 없는 크기면서 A와 B가 다르면 -1
    if A != B {
        result = -1
    }
}

print(result)