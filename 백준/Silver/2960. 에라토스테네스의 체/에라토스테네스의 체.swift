import Foundation

let NK = readLine()!.split(separator: " ").map { Int($0)! }
let N = NK[0]
var K = NK[1]

var visited = [Bool](repeating: false, count: N+1)
visited[0] = true
visited[1] = true

func isPrime(_ num: Int) -> Bool {
    var result = true
    for i in 2...num {
        if (num % i == 0) && (i != num) {
            result = false
            break
        }
    }
    return result
}

loop: for i in 2...N {
    if !visited[i] && isPrime(i) {
        visited[i] = true
        K -= 1
        if K == 0 {
            print(i)
            break loop
        }
        for j in stride(from: i, through: N, by: i) {
            if !visited[j] {
                visited[j] = true
                K -= 1
                if K == 0 {
                    print(j)
                    break loop
                }
            }
        }
    }
}