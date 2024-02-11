import Foundation

let N = Int(readLine()!)!
let A = readLine()!.split(separator: " ").map { Int($0)! }
var operators = readLine()!.split(separator: " ").map { Int($0)! } // [+, -, *, /] 순서

var result = [Int]()
var stack = [Int]() // 0:+, 1:-, 2:*, 3:/

func dfs(_ depth: Int) {
    if depth == N-1 {
        var output = A[0]
        for k in 0..<N-1 {
            switch stack[k] {
            case 0: // +
                output += A[k+1]
            case 1: // -
                output -= A[k+1]
            case 2: // *
                output *= A[k+1]
            case 3: // /
                output /= A[k+1]
            default:
                break
            }
        }
        result.append(output)
    }
    
    for i in 0..<4 {
        if operators[i] > 0 {
            stack.append(i)
            operators[i] -= 1
            dfs(depth+1)
            operators[i] += 1
            _ = stack.popLast()!
        }
    }
}

dfs(0)
print(result.max()!)
print(result.min()!)