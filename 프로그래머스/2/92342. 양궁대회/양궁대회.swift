import Foundation

/// 가장 낮은 점수를 더 많이 맞힌 순으로 정렬
func sortByLowerScoreCount(_ arr1: [Int], _ arr2: [Int]) -> Bool {
    for i in 0...10 {
        let idx = 10 - i
        if arr1[idx] != arr2[idx] {
            return arr1[idx] > arr2[idx]
        }
    }
    return true
}

/// `Parameters`
/// - n : 화살 개수
/// - info[i] : 어피치가 10-i 점을 맞힌 개수 (길이 11)
/// `Returns`
/// - 라이언이 가장 큰 점수 차이로 우승하기 위해 n 발을 어떤 과녁에 맞혀야 하는지 (길이 11)
/// - 여러가지일 경우, 가장 낮은 점수를 더 많이 맞힌 경우로
/// - 라이언이 우승할 수 없는 경우 [-1]
func solution(_ n:Int, _ info:[Int]) -> [Int] {
    var result: [Int: [[Int]]] = [:] // [점수차이: 라이언의 결과들]
    var ryanInfo: [Int] = []
    
    /// 라이언 - 어피치 점수 차이 (양수일 경우 라이언이 이김)
    func diffScore() -> Int {
        var apeach: Int = 0
        var ryan: Int = 0
        
        for i in 0...10 {
            // 둘 다 0개를 쏜 경우는 패스
            if ryanInfo[10-i] == 0 && info[10-i] == 0 {
                continue
            } else {
                if ryanInfo[10-i] > info[10-i] {
                    ryan += i
                } else {
                    apeach += i
                }
            }
        }
        return ryan - apeach
    }
    
    func dfs(_ i: Int, _ arrow: Int) {
        if i > 10 {
            // 남은 화살 털기
            if arrow > 0 {
                ryanInfo[i-1] += arrow
            }
            let diff = diffScore()
            if diff > 0 {
                result[diff, default: []].append(ryanInfo)
            }
            return
        }
        
        // 어피치보다 많이 쏠 수 있는 상태일 때
        if arrow > info[i] {
            // 어피치보다 많이 쏘고 점수 획득하기
            ryanInfo.append(info[i]+1)
            dfs(i+1, arrow-(info[i]+1))
            _ = ryanInfo.popLast()

            // 안쏘고 넘어가기
            ryanInfo.append(0)
            dfs(i+1, arrow)
            _ = ryanInfo.popLast()
        } else {
            ryanInfo.append(0)
            dfs(i+1, arrow)
            _ = ryanInfo.popLast()
        }
    }
    
    dfs(0, n)
    
    if result.keys.count == 0 {
        return [-1]
    } else {
        let maxDiff = result.keys.max()!
        return result[maxDiff]!.sorted { sortByLowerScoreCount($0, $1) }.first!
    }
}