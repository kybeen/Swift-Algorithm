import Foundation

var n = Int(readLine()!)!
var result = [Int]()

// n이 1인 경우에는 아무것도 출력하지X
if n > 1 {
    // 2부터 시작해서 나누어 떨어지면 계속 나누고, 나누어 떨어지지 않으면 나누는 수를 1씩 올린다.
    var now = 2
    while n != 1 {
        if n % now == 0 {
            result.append(now)
            n = n / now
        } else {
            now += 1
        }
    }
}

for r in result {
    print(r)
}