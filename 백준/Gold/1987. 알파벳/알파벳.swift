import Foundation

let RC = readLine()!.split(separator: " ").map { Int($0)! }
let R = RC[0]
let C = RC[1]
var board = [[Int]]()
for _ in 0..<R {
    board.append(readLine()!.map { Int($0.asciiValue!) - 65 })
}
var result = 0

let di = [-1, 1, 0, 0]
let dj = [0, 0, -1, 1]

func dfs(_ now: (Int, Int), _ visitedBit: Int, _ depth: Int) {
    result = max(result, depth)
    
    for k in 0..<4 {
        let new_i = now.0 + di[k]
        let new_j = now.1 + dj[k]
        
        if new_i < 0 || new_j < 0 || new_i >= R || new_j >= C {
            continue
        }
        let nextBit = 1 << board[new_i][new_j]
        if visitedBit & nextBit == 0 {
            dfs((new_i, new_j), visitedBit | nextBit, depth + 1)
        }
    }
}

dfs((0, 0), 1 << board[0][0], 1)
print(result)