import Foundation

var n = Int(readLine()!)!
var result = [String]()

if n == 0 {
    result.append("0")
} else {
    while n != 1 {
        // n이 음수일 때
        if n < 0 {
            // n이 음수이면서 -2로 나누어떨어지는 숫자가 아닐 때
            if -n % 2 == 1 {
                n = n/(-2) + 1
                result.append("1")
            } else {
                // n이 음수이면서 -2로 나누어떨어지는 숫자일 때
                n = n / (-2)
                result.append("0")
            }
        } else { // n이 양수일 때
            // n이 양수이면서 2로 나누어떨어지는 숫자가 아닐 때
            if n % 2 == 1 {
                n = n/(-2)
                result.append("1")
            } else {
                n = n/(-2)
                result.append("0")
            }
        }
    }
    result.append("1")
}
print(result.reversed().joined(separator: ""))