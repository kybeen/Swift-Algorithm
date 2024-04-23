let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0]
let M = NM[1]

var table: [[Int]] = [[Int](repeating: 0, count: N+1)]
for _ in 0..<N {
    table.append([0] + readLine()!.split(separator: " ").map { Int($0)! })
}

// (1,1) ~ (i,j)의 합으로 테이블 채우기
for i in 1...N {
    for j in 1...N {
        table[i][j] += table[i - 1][j] + table[i][j - 1] - table[i - 1][j - 1]
    }
}

for _ in 0..<M {
    let xy = readLine()!.split(separator: " ").map { Int($0)! }
    let x1 = xy[0]
    let y1 = xy[1]
    let x2 = xy[2]
    let y2 = xy[3]
    
    print(table[x2][y2] - table[x1-1][y2] - table[x2][y1-1] + table[x1-1][y1-1])
}