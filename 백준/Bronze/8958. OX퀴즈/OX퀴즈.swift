import Foundation

let T = Int(readLine()!)!
for _ in 0..<T {
    let ox = Array(readLine()!)
    var totalScore = 0
    var temp = 0
    for chr in ox {
        if chr == "X" {
            temp = 0
        } else {
            temp += 1
        }
        totalScore += temp
    }
    print(totalScore)
}