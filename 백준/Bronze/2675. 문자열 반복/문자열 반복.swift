import Foundation

let T = Int(readLine()!)!
for _ in 0..<T {
    let RS = readLine()!.split(separator: " ")
    let R = Int(RS[0])!
    let S = String(RS[1])
    
    var result = ""
    for chr in S {
        var temp = ""
        for _ in 0..<R {
            temp += String(chr)
        }
        result += temp
    }
    
    print(result)
}