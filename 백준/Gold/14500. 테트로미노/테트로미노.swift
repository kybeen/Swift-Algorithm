import Foundation

let size = readLine()!.split(separator: " ").map{ Int($0)! }
let n = size[0] // 세로
let m = size[1] // 가로
var paper = [[Int]]()

for _ in 0..<n {
    paper.append(readLine()!.split(separator: " ").map{ Int($0)! })
}

var result = 0
for i in 0..<n {
    for j in 0..<m {
        // 세로4 가로1 모양
        if i < n-3 {
            result = max(result, paper[i][j] + paper[i+1][j] + paper[i+2][j] + paper[i+3][j])
        }
        // 세로1 가로4 모양
        if j < m-3 {
            result = max(result, paper[i][j] + paper[i][j+1] + paper[i][j+2] + paper[i][j+3])
        }
        // 세로2 가로2 모양
        if i < n-1 && j < m-1 {
            result = max(result, paper[i][j] + paper[i][j+1] + paper[i+1][j] + paper[i+1][j+1])
        }
        // 세로3 가로2 모양
        if i < n-2 && j < m-1 {
            result = max(result, paper[i][j] + paper[i+1][j] + paper[i+2][j] + paper[i+2][j+1])
            result = max(result, paper[i][j+1] + paper[i+1][j+1] + paper[i+2][j+1] + paper[i+2][j])
            result = max(result, paper[i][j] + paper[i][j+1] + paper[i+1][j+1] + paper[i+2][j+1])
            result = max(result, paper[i][j] + paper[i][j+1] + paper[i+1][j] + paper[i+2][j])
            result = max(result, paper[i][j] + paper[i+1][j] + paper[i+1][j+1] + paper[i+2][j+1])
            result = max(result, paper[i][j+1] + paper[i+1][j] + paper[i+1][j+1] + paper[i+2][j])
            result = max(result, paper[i][j] + paper[i+1][j] + paper[i+2][j] + paper[i+1][j+1])
            result = max(result, paper[i][j+1] + paper[i+1][j+1] + paper[i+2][j+1] + paper[i+1][j])
        }
        // 세로2 가로3 모양
        if i < n-1 && j < m-2 {
            result = max(result, paper[i+1][j] + paper[i+1][j+1] + paper[i+1][j+2] + paper[i][j+2])
            result = max(result, paper[i][j] + paper[i+1][j] + paper[i+1][j+1] + paper[i+1][j+2])
            result = max(result, paper[i][j] + paper[i][j+1] + paper[i][j+2] + paper[i+1][j])
            result = max(result, paper[i][j] + paper[i][j+1] + paper[i][j+2] + paper[i+1][j+2])
            result = max(result, paper[i+1][j] + paper[i+1][j+1] + paper[i][j+1] + paper[i][j+2])
            result = max(result, paper[i][j] + paper[i][j+1] + paper[i+1][j+1] + paper[i+1][j+2])
            result = max(result, paper[i][j] + paper[i][j+1] + paper[i][j+2] + paper[i+1][j+1])
            result = max(result, paper[i+1][j] + paper[i+1][j+1] + paper[i+1][j+2] + paper[i][j+1])
        }
    }
}
print(result)