import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    var answer = 0
    
    func dfs(_ now: Int, _ sum: Int) {
        if now == numbers.count {
            if sum == target {
                answer += 1
            }
            return
        }
        
        dfs(now+1, sum+numbers[now])
        dfs(now+1, sum-numbers[now])
    }
    
    dfs(0, 0)
    
    return answer
}