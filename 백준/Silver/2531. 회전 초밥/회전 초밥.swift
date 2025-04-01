import Foundation

let input = readLine()!.split(separator: " ").map({ Int($0)! })
let (N, d, k, c) = (input[0], input[1], input[2], input[3])
var dishes = [Int]()
for _ in 0..<N {
    let sushi = Int(readLine()!)!
    dishes.append(sushi)
}

var answer = 0
var sushiCount = [Int: Int]()
var typeCount = 0 // 현재 초밥 종류 개수

// 초기 윈도우 개수에 맞게 세팅
for i in 0..<k {
    let sushi = dishes[i]
    sushiCount[sushi, default: 0] += 1
    if sushiCount[sushi, default: 0] == 1 {
        typeCount += 1
    }
}
if sushiCount[c, default: 0] == 0 {
    answer = max(answer, typeCount+1) // 쿠폰 초밥 추가
} else {
    answer = max(answer, typeCount)
}

for i in 1..<N {
    let left = i % N
    let right = (i+k-1) % N
    
    let prevSushi = dishes[left-1]
    sushiCount[prevSushi, default: 0] -= 1
    if sushiCount[prevSushi, default: 0] == 0 {
        typeCount -= 1
    }
    
    let nowSushi = dishes[right]
    sushiCount[nowSushi, default: 0] += 1
    if sushiCount[nowSushi, default: 0] == 1 {
        typeCount += 1
    }
    
    let nowMaxTypeCount = (sushiCount[c, default: 0] == 0) ? typeCount+1 : typeCount
    answer = max(answer, nowMaxTypeCount)
}

print(answer)