import Foundation

let oct = Array(readLine()!)
var result: String = ""

var isFirst = true
for o in oct {
    var binary = String(Int(String(o), radix: 8)!, radix: 2)
    // 가장 앞쪽(왼쪽) 자리수일 경우에는 빈 자리를 0으로 채울 필요 X
    if isFirst {
        isFirst = false
        result += String(binary)
        continue
    }
    
    // 8진수를 2진수로 변환했을 때 3자리가 되도록 앞부분에 0을 채워준다.
    if binary.count == 2 {
        binary = "0" + binary
    } else if binary.count == 1 {
        binary = "00" + binary
    }
    result += String(binary)
}
print(result)