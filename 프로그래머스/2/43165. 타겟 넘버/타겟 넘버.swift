import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    let n = numbers.count
    var result = 0
    
    var queue = [(Int, Int)]() // (현재인덱스, 계산 결과)
    var idx = 0
    queue.append((0, numbers[0]))
    queue.append((0, -numbers[0]))
    
    while idx < queue.count {
        let now = queue[idx]
        
        // 마지막 수까지 계산했을 때
        if now.0 == n-1 {
            // target과 계산 결과가 일치하면 result 1 증가
            if now.1 == target {
                result += 1
            }
        }
        
        if now.0 < n-1 {
            queue.append((now.0+1, now.1+numbers[now.0+1]))
            queue.append((now.0+1, now.1-numbers[now.0+1]))
        }
        
        idx += 1
    }
    
    return result
}