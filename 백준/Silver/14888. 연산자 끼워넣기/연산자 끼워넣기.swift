import Foundation

let N = Int(readLine()!)!
let A = readLine()!.split(separator: " ").map { Int($0)! }
var operators = readLine()!.split(separator: " ").map { Int($0)! } // +, -, *, / 순서

var minResult = Int.max
var maxResult = Int.min

func dfs(_ depth: Int, _ result: Int) {
    // 모든 연산이 끝나면 최대/최소 갱신
    if depth == N-1 {
        minResult = min(minResult, result)
        maxResult = max(maxResult, result)
    }
    
    for i in 0..<4 {
        // 사용할 수 있는 연산자가 남아 있으면
        if operators[i] > 0 {
            operators[i] -= 1
            
            // 해당 연산자를 적용한 결과를 전달하며 dfs 진행
            switch i {
            case 0:
                dfs(depth+1, result+A[depth+1])
            case 1:
                dfs(depth+1, result-A[depth+1])
            case 2:
                dfs(depth+1, result*A[depth+1])
            case 3:
                dfs(depth+1, result/A[depth+1])
            default:
                break
            }
            
            operators[i] += 1
        }
    }
}

dfs(0, A[0])
print(maxResult)
print(minResult)