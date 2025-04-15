import Foundation

let N = Int(readLine()!)!
let A = readLine()!.split(separator: " ").map { Int($0)! }
var operators = readLine()!.split(separator: " ").map { Int($0)! } // +, -, *, / 개수

var minResult = Int.max
var maxResult = Int.min

func dfs(_ depth: Int, _ nowResult: Int) {
    if depth == N {
        minResult = min(minResult, nowResult)
        maxResult = max(maxResult, nowResult)
        return
    }
    
    for i in 0..<4 {
        if operators[i] > 0 {
            operators[i] -= 1
            
            switch i {
            case 0:
                dfs(depth+1, nowResult+A[depth])
            case 1:
                dfs(depth+1, nowResult-A[depth])
            case 2:
                dfs(depth+1, nowResult*A[depth])
            case 3:
                dfs(depth+1, nowResult/A[depth])
            default:
                break
            }
            
            operators[i] += 1
        }
    }
}

dfs(1, A[0])
print(maxResult)
print(minResult)