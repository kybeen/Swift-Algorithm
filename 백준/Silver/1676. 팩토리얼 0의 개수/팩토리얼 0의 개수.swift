import Foundation

let n = Int(readLine()!)!
if n <= 1 {
    print(0)
} else {
    // 2의 개수가 무조건 5보다 많기 때문에 5의 개수를 구해준다.
    var fiveMulCnt = 0
    for i in 2...n {
        // N <= 500 이기 때문에 5^1, 5^2, 5^3까지의 배수 개수를 구해준다.
        if i % 5 == 0 {
            fiveMulCnt += 1
        }
        if i % 25 == 0 {
            fiveMulCnt += 1
        }
        if i % 125 == 0 {
            fiveMulCnt += 1
        }
    }
    print(fiveMulCnt)
}