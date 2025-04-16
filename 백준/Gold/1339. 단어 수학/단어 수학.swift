import Foundation

let N = Int(readLine()!)!
var priority = [Character: Int]() // 각 알파벳의 자릿수 기반 가중치
for _ in 0..<N {
    let word = readLine()!
    for (idx, chr) in word.reversed().enumerated() {
        priority[chr, default: 0] += (Int(pow(Double(10), Double(idx))))
    }
}
//print(priority)

var answer = 0
var bestNumber = 9
for (_, priority) in priority.sorted(by: { $0.value > $1.value }) {
    answer += (bestNumber * priority)
    bestNumber -= 1
}
print(answer)