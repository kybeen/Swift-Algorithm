let T = Int(readLine()!)!
var answer = [Int]()
for _ in 0..<T {
    let N = Int(readLine()!)!
    let price = readLine()!.split(separator: " ").map({ Int($0)! })
    
    var totalBenefit = 0
    var maxPrice = price[N-1]
    
    for i in stride(from: N-2, through: 0, by: -1) {
        if price[i] > maxPrice {
            maxPrice = price[i]
        } else {
            let benefit = maxPrice - price[i]
            totalBenefit += benefit
        }
    }
    
    answer.append(totalBenefit)
}

answer.forEach { print($0) }