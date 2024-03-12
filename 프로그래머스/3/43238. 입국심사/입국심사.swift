import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int {
    var result = Int.max
    // 가장 빠른 심사관이 혼자서 n명을 심사했을 때를 기준으로 start ~ end 범위를 잡는다.
    let shortest = times.min()!
    var start = shortest
    var end = shortest * n
    var mid = (start + end) / 2
    
    // 해당 mid 시간 동안 심사할 수 있는 사람들의 수
    func checkMid(_ mid: Int) -> Int {
        var cnt = 0
        // 각 심사관 별로 mid 시간까지 심사할 수 있는 사람들의 수를 더해줌
        for time in times {
            cnt += (mid / time)
        }
        return cnt
    }
    
    while start <= end {
        mid = (start + end) / 2
        // n명보다 많이 심사할 수 있는 시간이라면 그 이전만 확인
        if checkMid(mid) >= n {
            result = min(result, mid)
            end = mid - 1
        } else {
            // n명보다 적게 심사할 수 있는 시간이라면 그 이후만 확인
            start = mid + 1
        }
    }
    
    return result
}