import Foundation

let N = Int(readLine()!)!
var opinions = [Int]()
for _ in 0..<N {
    let opinion = Int(readLine()!)!
    opinions.append(opinion)
}

if N == 0 {
    print(0)
} else {
    opinions.sort(by: <)
    let exclude = Int(round(Double(N) * (15.0/100.0))) // 제외할 의견 개수
    var sum = 0
    for i in exclude..<N-exclude {
        sum += opinions[i]
    }
    let count = N - (exclude * 2)
    print(Int(round(Double(sum) / Double(count))))
}