import Foundation

let t = Int(readLine()!)!
for _ in 0..<t {
    let n = Int(readLine()!)!
    var stickers = [[Int]]()
    for _ in 0..<2 {
        stickers.append( readLine()!.split(separator: " ").map{ Int($0)! } )
    }
    
    // dp[i][j] 위치의 스티커를 뗄 경우 최댓값
    var dp = [[Int]](repeating: [Int](repeating: 0, count: n), count: 3)
    dp[0][0] = stickers[0][0]
    dp[1][0] = stickers[1][0]
    dp[2][0] = 0
    if n > 1 {
        for i in 1..<n {
            dp[0][i] = max(dp[1][i-1], dp[2][i-1]) + stickers[0][i]
            dp[1][i] = max(dp[0][i-1], dp[2][i-1]) + stickers[1][i]
            dp[2][i] = max(dp[0][i-1], dp[1][i-1], dp[2][i-1]) // 떼지 않았을 때
        }
    }
    
    var result = [Int]()
    for i in 0..<3 {
        result.append(dp[i].max()!)
    }
    print(result.max()!)
}