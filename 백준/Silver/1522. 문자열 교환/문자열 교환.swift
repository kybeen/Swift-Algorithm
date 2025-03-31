import Foundation

let str = Array(readLine()!)
let windowSize = str.filter({ $0 == "a" }).count
var left = 0
var right = windowSize - 1
var answer = Int.max

if windowSize == 0 { // a가 없으면
    print(0)
} else if str.count <= 3 {
    print(0)
} else {
    while right < (str.count * 2 - 1) {
        var bCount = 0
        for i in left...right {
            if str[i % str.count] == "b" {
                bCount += 1
            }
        }
        answer = min(answer, bCount)
        
        left += 1
        right += 1
    }
    print(answer)
}