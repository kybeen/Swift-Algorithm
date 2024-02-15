import Foundation

let N = Int(readLine()!)!
let W = readLine()!.split(separator: " ").map { Int($0)! }

var result = 0

// removeIdx: 제거한 구슬의 인덱스, nowW: 구슬이 제거된 배열, sum: 에너지 총합
func dfs(_ nowW: [Int], _ sum: Int) {
    result = max(result, sum)
    
    // 현재 배열의 길이가 3 이상이면 제거할 구슬 찾기
    if nowW.count >= 3 {
        for i in 1..<nowW.count-1 {
            // 구슬 제거
            var newW = nowW
            newW.remove(at: i)
            let energy = newW[i-1] * newW[i] // 획득 에너지
            dfs(newW, sum + energy)
        }
    }
}

dfs(W, 0)
print(result)