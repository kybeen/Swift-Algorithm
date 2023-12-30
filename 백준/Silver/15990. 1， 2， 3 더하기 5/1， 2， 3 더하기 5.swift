import Foundation

// dp[i][j] : 숫자 i를 만드는 경우의 수 중 j로 끝나는 경우의 수
// 입력을 받을 때마다 배열을 생성해주면 불필요한 연산을 반복하게 되기 때문에 입력을 받기 전에 배열 생성
var dp = [[Int]](repeating: [Int](repeating: 0, count: 4) , count: 100001)
dp[1][1] = 1
dp[2][2] = 1
dp[3] = [0, 1, 1, 1]
for i in 4..<100001 {
    dp[i][1] = (dp[i-1][2] + dp[i-1][3]) % 1000000009
    dp[i][2] = (dp[i-2][1] + dp[i-2][3]) % 1000000009
    dp[i][3] = (dp[i-3][1] + dp[i-3][2]) % 1000000009
}

let t = Int(readLine()!)!
for _ in 0..<t {
    let n = Int(readLine()!)!
    if n == 1 {
        print(1)
    } else if n == 2 {
        print(1)
    } else if n == 3 {
        print(3)
    } else {
        print(dp[n].reduce(0){ $0 + $1 } % 1000000009) // dp[n][1] + dp[n][2] + dp[n][3]
    }
}