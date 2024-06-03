import Foundation

let N = Int(readLine()!)!
var nums = [Int]()

var sum: Double = 0 // 합
var maxVal = Int.min // 최대값
var minVal = Int.max // 최소값
var count = [Int:Int]() // 각 수의 등장 횟수
for _ in 0..<N {
    let num = Int(readLine()!)!
    
    if count[num] == nil {
        count[num] = 1
    } else {
        count[num]! += 1
    }
    sum += Double(num)
    maxVal = max(maxVal, num)
    minVal = min(minVal, num)
    
    nums.append(num)
}

// 산술평균 (sum이 음수일 때 부호 잠시 제외해서 처리
let avg = Int(round(abs(sum) / Double(N)))
print(sum < 0 ? -avg : avg)
// 중앙값
print(nums.sorted(by: <)[(N-1)/2])
// 최빈값
let mostAppeared = count.filter { $0.value == count.values.max()! }.sorted(by: { $0.key < $1.key })
print(mostAppeared.count == 1 ? mostAppeared[0].key : mostAppeared[1].key) // 최빈값
// 범위
print(maxVal - minVal)