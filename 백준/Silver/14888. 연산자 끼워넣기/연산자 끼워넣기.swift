import Foundation

let N = Int(readLine()!)!
let A = readLine()!.split(separator: " ").map { Int($0)! }
var operators = readLine()!.split(separator: " ").map { Int($0)! } // [+, -, *, /] 순서

var minResult = Int.max
var maxResult = Int.min
var stack = [Int]() // 0:+, 1:-, 2:*, 3:/

func dfs(_ depth: Int, _ nowValue: Int) {
    
    if depth == N-1 {
        minResult = min(minResult, nowValue)
        maxResult = max(maxResult, nowValue)
    }
    
    for i in 0..<4 {
        if operators[i] > 0 {
            stack.append(i)
            operators[i] -= 1
            switch i {
            case 0: // +
                dfs(depth+1, nowValue + A[depth+1])
            case 1: // -
                dfs(depth+1, nowValue - A[depth+1])
            case 2: // *
                dfs(depth+1, nowValue * A[depth+1])
            case 3: // /
                dfs(depth+1, nowValue / A[depth+1])
            default:
                break
            }
            operators[i] += 1
            _ = stack.popLast()
        }
    }
}

dfs(0, A[0])
print(maxResult)
print(minResult)