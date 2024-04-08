import Foundation

let N = Int(readLine()!)! // 지방의 수
var regions = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: <) // 각 지방의 예산요청 (오름차순 정렬)
let M = Int(readLine()!)! // 총 예산

// 각 지방에 예산 할당
func getTotalBudget(maximum: Int) -> Int {
    var total = 0
    for i in 0..<N {
        // 상한액 이상의 예산을 요청하면 상한액 만큼만 할당
        if regions[i] > maximum {
            total += maximum
        } else {
            total += regions[i]
        }
    }
    return total
}

var start = 1
var end = regions[N-1] + 1 // 요청한 예산보다 많이 주는 경우는 없기 때문에 끝값을 각 지방의 요청 예산 중 가장 큰값으로

while start + 1 < end {
    let mid = (start + end) / 2
    let totalBudget = getTotalBudget(maximum: mid)
    
    // 필요한 예산이 총 예산보다 작다면 더 큰 상한액을 확인
    if totalBudget <= M {
        start = mid
    } else {
        end = mid
    }
}

print(start)