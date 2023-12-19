import Foundation

let T = Int(readLine()!)!
for _ in 0..<T {
    let sentences = readLine()!.split(separator: " ")
    for word in sentences {
        print(String(word.reversed()), terminator: " ")
    }
    print()
}