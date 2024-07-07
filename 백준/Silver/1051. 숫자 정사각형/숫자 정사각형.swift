import Foundation

let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0]
let M = NM[1]

var square = [[Int]]()
for _ in 0..<N {
    let row = Array(readLine()!).map { Int(String($0))! }
    square.append(row)
}

var result = 1
for i in 0..<N-1 {
    for j in 0..<M-1 {
        let now = square[i][j]
        let maxOffset = min(N-1-i, M-1-j)
        for offset in 1...maxOffset {
            let down = i + offset
            let right = j + offset
            if (now == square[down][j]) && (now == square[i][right]) && (now == square[down][right]) {
                let length = offset + 1
                result = max(result, length*length)
            }
        }
    }
}

print(result)