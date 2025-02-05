let NM = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M) = (NM[0], NM[1])
var table = [[Int]]()
for _ in 0..<N {
    let row = readLine()!.split(separator: " ").map { Int($0)! }
    table.append(row)
}

// 누적합 테이블 생성
var dp = Array(repeating: Array(repeating: 0, count: N+1), count: N+1)
dp[1][1] = table[0][0]
for i in 2...N {
    dp[1][i] = dp[1][i-1] + table[0][i-1]
    dp[i][1] = dp[i-1][1] + table[i-1][0]
}
for i in 2...N {
    for j in 2...N {
        dp[i][j] = dp[i-1][j] + dp[i][j-1] - dp[i-1][j-1] + table[i-1][j-1]
    }
}

var result = [Int]()
for _ in 0..<M {
    let testCase = readLine()!.split(separator: " ").map { Int($0)! }
    let (x1, y1, x2, y2) = (testCase[0], testCase[1], testCase[2], testCase[3])
    
    let sum = dp[x2][y2] - dp[x1-1][y2] - dp[x2][y1-1] + dp[x1-1][y1-1]
    result.append(sum)
}
result.forEach { print($0) }