import Foundation

let N = Int(readLine()!)!
var dp = [Int](repeating: 0, count: 101) // i번 차례에서 출력할 수 있는 A의 최대 개수
var maxBuffer = [Int](repeating: 0, count: 101) // i번 차례에서 붙여넣을 수 있는 최대 A 개수 (버퍼에 들어 있는 최대 A의 개수)

// 1~6까지는 복붙 필요 x
for i in 1...6 {
    dp[i] = i
}

if N > 6 {
    for i in 7...N {
        var temp = i - 3
        var offset = 2
        while temp >= 1 {
            dp[i] = max(dp[i], dp[temp]*offset)
            temp -= 1
            offset += 1
        }
    }
}
print(dp[N])