let N = Int(readLine()!)!
var liquids = readLine()!.split(separator: " ").map({ Int($0)! })

var (left, right) = (0, N-1)
var minValue = Int.max
var answer: (Int, Int) = (liquids[left], liquids[right])

while left < right {
    let sum = liquids[left] + liquids[right]
    
    if abs(sum) < minValue {
        minValue = abs(sum)
        answer = (liquids[left], liquids[right])
    }
    
    if sum <= 0 {
        left += 1
    } else {
        right -= 1
    }
}

print("\(answer.0) \(answer.1)")